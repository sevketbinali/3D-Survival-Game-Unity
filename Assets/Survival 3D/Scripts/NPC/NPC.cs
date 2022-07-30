using System;
using System.Collections;
using System.Collections.Generic;
using System.Numerics;
using UnityEngine;
using UnityEngine.AI;
using Quaternion = UnityEngine.Quaternion;
using Random = UnityEngine.Random;
using Vector3 = UnityEngine.Vector3;


public enum AIType
{
    Passive,
    Scared,
    Aggresive
}

public enum AIState
{
    Idle,
    Wandering,
    Attacking,
    Fleeing
}
public class NPC : MonoBehaviour, IDamagable
{
    [Header("Stats")]
    public int health;
    public float walkSpeed;
    public float runSpeed;
    public ItemDatabase[] dropOnDeath;

    [Header("AI")] 
    public AIType aiType;
    private AIState aiState;
    public float detectDistance;
    public float safeDistance;

    [Header("Wandering")] 
    public float minWanderDistance;
    public float maxWanderDistance;
    public float minWanderWaitTime;
    public float maxWanderWaitTime;

    [Header("Combat")] 
    public int damage;
    public float attackRate;
    private float lastAttackTime;
    public float attackDistance;
    private float playerDistance;

    [Header("Sound")] 
    public AudioSource audioSource;
    
    //get components

    private NavMeshAgent agent;
    private Animator anim;
    private SkinnedMeshRenderer[] meshRenderers;

    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
        meshRenderers = GetComponentsInChildren<SkinnedMeshRenderer>();
    }

    private void Start()
    {
        SetState(AIState.Wandering);
        
    }

   
    private void Update()
    {
        //get Player distance
        playerDistance = Vector3.Distance(transform.position, PlayerController.instance.transform.position);
        anim.SetBool("Moving",aiState != AIState.Idle);
       
       
        
        
        switch (aiState)
        {
            case AIState.Idle: PassiveUpdate();
                break;
            case AIState.Wandering: PassiveUpdate();
                break;
            case AIState.Attacking: AttackingUpdate();
                break;
            case AIState.Fleeing: FleeingUpdate();
                break;
        }
    }

    void PassiveUpdate()
    {
        if (aiState == AIState.Wandering && agent.remainingDistance < 0.1f)
        {
            SetState(AIState.Idle);
            Invoke("WanderToNewLocation",Random.Range(minWanderWaitTime,maxWanderWaitTime));
        }
        
        //begin the attack to player if npc detect him
        if (aiType == AIType.Aggresive && playerDistance < detectDistance)
        {
            
            
            SetState(AIState.Attacking);
        }
        //run away from the player if we detect him
        else if (aiType == AIType.Scared && playerDistance < detectDistance)
        {
            SetState(AIState.Fleeing);
            agent.SetDestination(GetFleeLocation());
        }
        
    }

    void AttackingUpdate()
    {
        if (playerDistance > attackDistance)
        {
            agent.isStopped = false;
            agent.SetDestination(PlayerController.instance.transform.position);
        }
        else
        {
            agent.isStopped = true;
         
            if (Time.time - lastAttackTime > attackRate)
            {
                lastAttackTime = Time.time;
                PlayerController.instance.GetComponent<IDamagable>().TakePhysicDamage(damage);
                
                anim.SetTrigger("Attack");
                
            }
            
        }
    }

    void FleeingUpdate()
    {
        if (playerDistance < safeDistance && agent.remainingDistance < 0.1f)
        {
            agent.SetDestination(GetFleeLocation());
        }
        else if (playerDistance > safeDistance)
        {
            SetState(AIState.Wandering);
        }

    }

    void SetState(AIState newState)
    {
        aiState = newState;
        switch (aiState)
        {
            case AIState.Idle:
            {
                agent.speed = walkSpeed;
                agent.isStopped = true;
                break;
            }
            case AIState.Wandering:
            {
                agent.speed = walkSpeed;
                agent.isStopped = false;
                break;
            }
            case AIState.Attacking:
            {
                agent.speed = runSpeed;
                agent.isStopped = false;
                break;
            }
                
            case AIState.Fleeing:
            {
                agent.speed = runSpeed;
                agent.isStopped = false;
                break;
            }
                
            
        }
        
    }

    void WanderToNewLocation()
    {
        // if npc is not in idle state dont call for new destination
        if (aiState != AIState.Idle)
            return;
        
        SetState(AIState.Wandering);
        agent.SetDestination(GetWanderLocation());
    }

    Vector3 GetWanderLocation()
    {
        NavMeshHit hit;
        NavMesh.SamplePosition(transform.position +
                               (Random.onUnitSphere * Random.Range(minWanderDistance, maxWanderDistance)),out hit, maxWanderDistance,NavMesh.AllAreas);

        int i = 0;

        while (Vector3.Distance(transform.position, hit.position) < detectDistance)
        {
            NavMesh.SamplePosition(transform.position +
                                   (Random.onUnitSphere * Random.Range(minWanderDistance, maxWanderDistance)),out hit, maxWanderDistance,NavMesh.AllAreas);
            i++;
            if (i == 30)
                break;
        }

        //dont allow npc  to walk near player
        return hit.position;
    }

    Vector3 GetFleeLocation()
    {
        NavMeshHit hit;
        NavMesh.SamplePosition(transform.position + (Random.onUnitSphere * safeDistance), out hit, safeDistance,
            NavMesh.AllAreas);
        int i = 0;
        while (GetDestinationAngel(hit.position) > 90 || playerDistance < safeDistance)
        {
            NavMesh.SamplePosition(transform.position + (Random.onUnitSphere * safeDistance), out hit, safeDistance,
                NavMesh.AllAreas);
            i++;
            if (i == 30)
                break;
        }

        return hit.position;

    }

    float GetDestinationAngel(Vector3 targetPos)
    {
        return Vector3.Angle(transform.position - PlayerController.instance.transform.position,
            transform.position + targetPos);
    }
    
    
    
    public void TakePhysicDamage(int damageAmount)
    {
        health -= damageAmount;
       

        if (health <= 0)
            Die();

        StartCoroutine(DamageFlash());
        if (aiType == AIType.Passive)
            SetState(AIState.Fleeing);
    }

    private float delay = 0.0f;

    void Die()
    {
        for (int x = 0; x < dropOnDeath.Length; x++)
        {
            Instantiate(dropOnDeath[x].dropPrefab, transform.position, Quaternion.identity);
            
        }
        anim.SetTrigger("Die");
        Destroy(gameObject,this.GetComponentInChildren<Animator>().GetCurrentAnimatorStateInfo(0).length+delay);
    }

    IEnumerator DamageFlash()
    {
        
        audioSource.Play();
        for (int x = 0; x < meshRenderers.Length; x++)
            meshRenderers[x].material.color = new Color(1.0f, 0.5f, 0.5f);
        yield return new WaitForSeconds(0.1f);
        for (int x = 0; x < meshRenderers.Length; x++)
            meshRenderers[x].material.color = Color.white;

    }
}
