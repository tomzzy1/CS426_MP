// Augmented PCB
struct mp2_task_struct
{
    struct list_head node;
    enum
    {
        READY,
        RUNNING,
        SLEEPING
    } state;
    struct task_struct *task;
    // TODO: define any fields you need
    unsigned long deadline_jiff;
};

// Current running task
static struct mp2_task_struct *mp2_current;

// List head and lock
static struct mp2_task_struct head;
static spinlock_t list_lock;

/*
 * kthread_fn - EDF scheduling logic
 * @data: function argument, never used.
 *
 * Responsible for interacting with the scheduler API to perform context
 * switches between tasks. The thread is waken up whenever a task yields
 * (which gives up the CPU) or the wakeup_timer of a task fires (where
 * preemption may occur).
 */
static int kthread_fn(void *data)
{
    // TODO: Add any local variables you need
    struct mp2_task_struct *temp = NULL;
    struct mp2_task_struct *task = NULL;
    struct sched_attr attr;
    // Sleep
    set_current_state(TASK_INTERRUPTIBLE);
    schedule();

    // Work loop
    while (!kthread_should_stop())
    {
        // TODO: traverse the list to find the ready task with the highest
        // priority
        spin_trylock(&list_lock);
        list_for_each_entry(temp, &head, node)
        {
            if (temp->state == READY)
            {
                if (!task || temp->deadline_jiff < task->deadline_jiff)
                {
                    task = temp;
                    break;
                }
            }
        }
        spin_unlock(&list_lock);
        // TODO: Invoke scheduler to preempt the current process
        if (mp2_current)
        {
            attr.sched_policy = SCHED_NORMAL;
            attr.sched_priority = 0;
            sched_setattr_nocheck(mp2_current->task, &attr);
            if (mp2_current->state == RUNNING)
			{
				mp2_current->state = READY;
			}
        }
        // TODO: Wake up the next process, invoke scheduler to perform the
        // context switch
        // Sleep
        mp2_current = task;
        task->state = RUNNING;
        wake_up_process(task->task);
        attr.sched_policy = SCHED_FIFO;
        attr.sched_priority = 99;
        sched_setattr_nocheck(task->task, &attr);
        set_current_state(TASK_INTERRUPTIBLE);
        schedule();
    }
    return 0;
}
