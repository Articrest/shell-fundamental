#!/bin/bash

TODO_FILE=~/todo.txt

# Create the todo file if it doesn’t exist
touch "$TODO_FILE"

while true; do
    echo ""
    echo "====== TO-DO LIST MANAGER ======"
    echo "1. View all tasks"
    echo "2. Add a new task"
    echo "3. Delete a task"
    echo "4. Exit"
    echo "================================"
    read -p "Choose an option [1-4]: " option

    case $option in
        1)
            echo -e "\nYour Tasks:"
            if [ -s "$TODO_FILE" ]; then
                nl -w2 -s'. ' "$TODO_FILE"
            else
                echo "No tasks found!"
            fi
            ;;
        2)
            read -p "Enter new task: " task
            echo "$task" >> "$TODO_FILE"
            echo "Task added."
            ;;
        3)
            nl -w2 -s'. ' "$TODO_FILE"
            read -p "Enter task number to delete: " num
            if [[ "$num" =~ ^[0-9]+$ ]]; then
                sed -i "${num}d" "$TODO_FILE"
                echo "Task deleted."
            else
                echo "Invalid input. Please enter a number."
            fi
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option, try again."
            ;;
    esac
done
