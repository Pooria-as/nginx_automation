manage_nginx() {
    # Print ASCII Art
    echo "
  _   _       _                 _         _                        _
 | \ | | __ _(_)_ __ __  __    / \  _   _| |_ ___  _ __ ___   __ _| |_ ___
 |  \| |/ _\` | | '_ \\ \/ /   / _ \\| | | | __/ _ \\| '_ \` _ \\ / _\` | __/ _ \\
 | |\  | (_| | | | | |>  <   / ___ \\ |_| | || (_) | | | | | | (_| | ||  __/
 |_| \\_|\\__, |_|_| |_/_/\\_\\ /_/   \\_\\__,_|\\__\\___/|_| |_| |_|\\__,_|\\__\\___|
        |___/
"

    echo "What would you like to do with the Nginx service?"
    echo "1. Start Nginx"
    echo "2. Stop Nginx"
    echo "3. Restart Nginx"
    echo "4. Check Nginx Status"
    echo "5. Check Nginx Syntax"
    echo "6. see access log"
    echo "7. see error  log"
    echo "8. kill nginx process"
    echo "9. Exit"

    read -p "Please enter your choice (1-9): " choice

    case $choice in
        1)
            echo "Starting Nginx..."
            sudo systemctl start nginx
            echo "Nginx started."
            ;;
        2)
            echo "Stopping Nginx..."
            sudo systemctl stop nginx
            echo "Nginx stopped."
            ;;
        3)
            echo "Restarting Nginx..."
            sudo systemctl restart nginx
            echo "Nginx restarted."
            ;;
        4)
            echo "Checking Nginx status..."
            sudo systemctl status nginx | grep Active
            ;;
        5)
            echo "Checking Nginx syntax..."
            sudo /usr/sbin/nginx -t
            ;;
	6)  tail -f /var/log/nginx/access.log
	    ;;
	7) 
	    tail -f /var/log/nginx/error.log
    
        ;;
	8) killall nginx 
            ;;
		
        9)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            manage_nginx  # Call the function again for valid input
            ;;
    esac
}

# Run the function
manage_nginx

