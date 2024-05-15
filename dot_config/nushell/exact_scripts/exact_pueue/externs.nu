use completions.nu *

# Interact with the Pueue daemon
# Usage: pueue [OPTIONS] [COMMAND]
export extern pueue [
  --verbose(-v)                                   # Verbose mode (-v, -vv, -vvv)
  --color:       string@"nu-complete pueue color" # Colorize the output
  --config(-c):  string                           # If provided, Pueue only uses this config file
  --profile(-p): string                           # The name of the profile that should be loaded from your config file
  --help(-h)                                      # Print help
  --version(-V)                                   # Print version
]

# Enqueue a task for execution. There're many different options when scheduling
# a task. Check the individual option help texts for more information.
#   
# Furthermore, please remember that scheduled commands are executed via your
# system shell. This means that the command needs proper shell escaping.
#   
# The safest way to preserve shell escaping is to surround your command with
# quotes, for example:
#   
# pueue add 'ls $HOME && echo "Some string"'
export extern "pueue add" [
  command: any # The command to be added
  --working-directory(-w): string # Specify current working directory
  --escape(-e) # Escape any special shell characters (" ", "&", "!", etc.). Beware: This implicitly disables nearly all shell specific syntax ("&&", "&>")
  --immediate(-i) # Immediately start the task
  --stashed(-s) # Create the task in Stashed state. Useful to avoid immediate execution if the queue is empty
  --delay(-d): string # Prevents the task from being enqueued until <delay> elapses. See "enqueue" for accepted formats
  --group(-g): string@"nu-complete pueue groups" # Assign the task to a group. Groups kind of act as separate queues. I.e. all groups run in parallel and you can specify the amount of parallel tasks for each group. If no group is specified, the default group will be used
  --after(-a): int@"nu-complete pueue tasks" # Start the task once all specified tasks have successfully finished. As soon as one of the dependencies fails, this task will fail as well
  --priority(-o): int # Start this task with a higher priority. The higher the number, the faster it will be processed
  --label(-l) string # Add some information for yourself. This string will be shown in the "status" table. There's no additional logic connected to it
  --print-task-id(-p) # Only return the task id instead of a text. This is useful when working with dependencies
  --help(-h) # Print help
]

# Remove tasks from the list. Running or paused tasks need to be killed first
export extern "pueue remove" [
  ...task_ids: int@"nu-complete pueue tasks" # The task ids to be removed
  --help(-h)                                 # Print help
]

# Switches the queue position of two commands. Only works on queued and stashed commands
export extern "pueue switch" [
  task_id_1: int@"nu-complete pueue tasks" # The first task id
  task_id_2: int@"nu-complete pueue tasks" # The second task id
  --help(-h)                               # Print help
]

# Stashed tasks won't be automatically started. You have to enqueue them or start them by hand
export extern "pueue stash" [
  ...task_id: string@"nu-complete pueue tasks" # Stash these specific tasks
  --help(-h)                                   # Print help
]

# Enqueue stashed tasks. They'll be handled normally afterwards
#  
# DELAY FORMAT:
#  
# The --delay argument must be either a number of seconds or a "date expression" similar to GNU "date -d" with some extensions. It does not attempt to parse all natural language, but is incredibly flexible. Here are some supported examples.
#  
# 2020-04-01T18:30:00   // RFC 3339 timestamp
# 2020-4-1 18:2:30      // Optional leading zeros
# 2020-4-1 5:30pm       // Informal am/pm time
# 2020-4-1 5pm          // Optional minutes and seconds
# April 1 2020 18:30:00 // English months
# 1 Apr 8:30pm          // Implies current year
# 4/1                   // American form date
# wednesday 10:30pm     // The closest wednesday in the future at 22:30
# wednesday             // The closest wednesday in the future
# 4 months              // 4 months from today at 00:00:00
# 1 week                // 1 week at the current time
# 1days                 // 1 day from today at the current time
# 1d 03:00              // The closest 3:00 after 1 day (24 hours)
# 3h                    // 3 hours from now
# 3600s                 // 3600 seconds from now
export extern "pueue enqueue" [
  ...task_ids: int@"nu-complete pueue tasks" # The tasks to enque
  --delay(-d): string                        # Delay enqueuing these tasks until <delay> elapses. See DELAY FORMAT below
  --help(-h)                                 # Print help
]

# Resume operation of specific tasks or groups of tasks.
# By default, this resumes the default group and all its tasks.
# Can also be used force-start specific tasks.
export extern "pueue start" [
  ...task_ids: int@"nu-complete pueue tasks"     # Start these specific tasks. Paused tasks will resumed. Queued or Stashed tasks will be force-started
  --group(-g): string@"nu-complete pueue groups" # Resume a specific group and all paused tasks in it. The group will be set to running and its paused tasks will be resumed
  --all(-a)                                      # Resume all groups! All groups will be set to running and paused tasks will be resumed
  --children(-c)                                 # Deprecated: this switch no longer has any effect
  --help(-h)                                     # Print help
]

# Restart failed or successful task(s).
# By default, identical tasks will be created and enqueued, but it's possible to restart in-place.
# You can also edit a few properties, such as the path and the command, before restarting.
export extern "pueue restart" [
  ...task_ids:           int@"nu-complete pueue tasks"     # Restart these specific tasks
  --all-failed(-a)                                         # Restart all failed tasks across all groups. Nice to use in combination with `-i/--in-place`
  --failed-in-group(-g): string@"nu-complete pueue groups" # Like `--all-failed`, but only restart tasks failed tasks of a specific group. The group will be set to running and its paused tasks will be resumed
  --start-immediately(-k)                                  # Immediately start the tasks, no matter how many open slots there are. This will ignore any dependencies tasks may have
  --stashed(-s)                                            # Set the restarted task to a "Stashed" state. Useful to avoid immediate execution
  --in-place(-i)                                           # Restart the task by reusing the already existing tasks. This will overwrite any previous logs of the restarted tasks
  --not-in-place                                           # Restart the task by creating a new identical tasks. Only applies, if you have the restart_in_place configuration set to true
  --edit(-e)                                               # Edit the tasks' commands before restarting
  --edit-path(-p)                                          # Edit the tasks' paths before restarting
  --edit-label(-l)                                         # Edit the tasks' labels before restarting
  --edit-priority(-o)                                      # Edit the tasks' priorities before restarting
  --help(-h)                                               # Print help
]

# Either pause running tasks or specific groups of tasks.
# By default, pauses the default group and all its tasks.
# A paused queue (group) won't start any new tasks.
export extern "pueue pause" [
  ...task_ids: string@"nu-complete pueue tasks"  # Pause these specific tasks. Does not affect the default group, groups or any other tasks
  --group(-g): string@"nu-complete pueue groups" # Pause a specific group
  --all(-a)                                      # Pause all groups!
  --wait(-w)                                     # Only pause the specified group and let already running tasks finish by themselves
  --children(-c)                                 # Deprecated: this switch no longer has any effect
  --help(-h)                                     # Print help
]

# Kill specific running tasks or whole task groups..
# Kills all tasks of the default group when no ids or a specific group are provided.
export extern "pueue kill" [
  ...task_ids: string@"nu-complete pueue tasks"  # Kill these specific tasks
  --group(-g): string@"nu-complete pueue groups" # Kill all running tasks in a group. This also pauses the group
  --all(-a)                                      # Kill all running tasks across ALL groups. This also pauses all groups
  --children(-c)                                 # Deprecated: this switch no longer has any effect
  --signal(-s): int                              # Send a UNIX signal instead of simply killing the process. DISCLAIMER: This bypasses Pueue's process handling logic! You might enter weird invalid states, use at your own descretion
  --help(-h)                                     # Print help
]

# Send something to a task. Useful for sending confirmations such as 'y\n'
export extern "pueue send" [
  task_id: int@"nu-complete pueue tasks", # The task id
  input:   string                         # The command to send to the task
  --help(-h)                              # Print help
]

# Edit the command, path, label, or priority of a stashed or queued task.
# By default only the command is edited.
# Multiple properties can be added in one go.
export extern "pueue edit" [
  task_id: int@"nu-complete pueue tasks" # The task's id
  --command(-c)                          # Edit the task's command
  --path(-p)                             # Edit the task's path
  --label(-l)                            # Edit the task's label
  --priority(-o)                         # Edit the task's priority
  --help(-h)                             # Print help
]

# Use this to add or remove groups.
# By default, this will simply display all known groups.
export extern "pueue group" [
  --json(-j)  # Print the list of groups as json
  --help(-h)  # Print help
]

# Add a group by name
export extern "pueue group add" [
  name:           string # The group name to add
  --parallel(-p): int    # Set the amount of parallel tasks this group can have. Setting this to 0 means an unlimited amount of parallel tasks
  --help(-h)             # Print help
]

# Remove a group by name. This will move all tasks in this group to the default group!
export extern "pueue group remove" [
  name: string@"nu-complete pueue groups" # The name of the group to remove
  --help(-h)                              # Print help
]


# Display the current status of all tasks
#   
# Query
#   Users can specify a custom query to filter for specific values, order by a column
#   or limit the amount of tasks listed.
#   
#   Syntax:
#      [column_selection]? [filter]* [order_by]? [limit]?
#   
#   where:
#     - column_selection := `columns=[column]([column],)*`
#     - column := `id | status | command | label | path | enqueue_at | dependencies | start | end`
#     - filter := `[filter_column] [filter_op] [filter_value]`
#       (note: not all columns support all operators, see "Filter columns" below.)
#     - filter_column := `start | end | enqueue_at | status | label`
#     - filter_op := `= | != | < | > | %=`
#       (`%=` means 'contains', as in the test value is a substring of the column value)
#     - order_by := `order_by [column] [order_direction]`
#     - order_direction := `asc | desc`
#     - limit := `[limit_type]? [limit_count]`
#     - limit_type := `first | last`
#     - limit_count := a positive integer
#   
#   Filter columns:
#     - `start`, `end`, `enqueue_at` contain a datetime
#       which support the operators `=`, `!=`, `<`, `>`
#       against test values that are:
#         - date like `YYYY-MM-DD`
#         - time like `HH:mm:ss` or `HH:mm`
#         - datetime like `YYYY-MM-DDHH:mm:ss`
#           (note there is currently no separator between the date and the time)
#   
#   Examples:
#     - `status=running`
#     - `columns=id,status,command status=running start > 2023-05-2112:03:17 order_by command first 5`
#   
#   The formal syntax is defined here:
#   https://github.com/Nukesor/pueue/blob/main/pueue/src/client/query/syntax.pest
#   
#   More documentation is on the query syntax PR:
#   https://github.com/Nukesor/pueue/issues/350#issue-1359083118
export extern "pueue status" [
  query?:      string                            # The query
  --json(-j)                                     # Print the current state as json to stdout. This does not include the output of tasks. Use `log -j` if you want everything
  --group(-g): string@"nu-complete pueue groups" # Only show tasks of a specific group
  --help(-h)                                     # Print help (see a summary with '-h')
]

# TODO: format-status  Accept a list or map of JSON pueue tasks via stdin and display it just like "pueue status".
#                     A simple example might look like this:
#                     pueue status --json | jq -c '.tasks' | pueue format-status

# Display the log output of finished tasks.
# Only the last few lines will be shown by default.
# If you want to follow the output of a task, please use the "follow" subcommand.
export extern "pueue log" [
  ...task_ids: int@"nu-complete pueue tasks" # View the task output of these specific tasks
  --json(-j)                                 # Print the resulting tasks and output as json. By default only the last lines will be returned unless --full is provided. Take care, as the json cannot be streamed! If your logs are really huge, using --full can use all of your machine's RAM
  --lines(-l): int                           # Only print the last X lines of each task's output. This is done by default if you're looking at multiple tasks
  --full(-f)                                 # Show the whole output
  --help(-h)                                 # Print help
]

# Follow the output of a currently running task. This command works like "tail -f"
export extern "pueue follow" [
  task_id:     int@"nu-complete pueue tasks" # The id of the task you want to watch. If no or multiple tasks are running, you have to specify the id. If only a single task is running, you can omit the id
  --lines(-l): int                           # Only print the last X lines of the output before following
  --help(-h)                                 # Print help
]
 
# Wait until tasks are finished.
# By default, this will wait for all tasks in the default group to finish.
# Note: This will also wait for all tasks that aren't somehow 'Done'.
# Includes: [Paused, Stashed, Locked, Queued, ...]
export extern "pueue wait" [
  ...task_ids:  int@"nu-complete pueue tasks"        # This allows you to wait for specific tasks to finish
  --group(-g):  string@"nu-complete pueue groups"    # Wait for all tasks in a specific group
  --all(-a)                                          # Wait for all tasks across all groups and the default group
  --quiet(-q)                                        # Don't show any log output while waiting
  --status(-s): string@"nu-complete pueue statuses"  # Wait for tasks to reach a specific task status
  --help(-h)                                         # Print help
]

# Remove all finished tasks from the list
export extern "pueue clean" [
  --successful-only(-s)                             # Only clean tasks that finished successfully
  --group(-g): string@"nu-complete pueue groups"    # Only clean tasks of a specific group
  --help(-h)                                        # Print help
]

# Kill all tasks, clean up afterwards and reset EVERYTHING!
export extern "pueue reset" [
  --children(-c)  # Deprecated: this switch no longer has any effect
  --force(-f)     # Don't ask for any confirmation
  --help(-h)      # Print help
]

# Remotely shut down the daemon. Should only be used if the daemon isn't started by a service manager
export extern "pueue shutdown" [
  --help(-h)  # Print help
]

# Set the amount of allowed parallel tasks
# By default, adjusts the amount of the default group.
# No tasks will be stopped, if this is lowered.
# This limit is only considered when tasks are scheduled.
export extern "pueue parallel" [
  parallel_tasks: int                                # The amount of allowed parallel tasks. Setting this to 0 means an unlimited amount of parallel tasks
  --group(-g):    string@"nu-complete pueue groups"  # Set the amount for a specific group
  --help(-h)                                         # Print help
]

# Generates shell completion files. This can be ignored during normal operations
export extern "pueue completions" [
  shell: string@"nu-complete pueue shells" # The target shell
  output_directory?: string
  --help(-h)  # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "pueue help" [
  command?: string # The command to get help for
]
