CONT_NAME=radarays_container

up:
	docker compose up -d

enter:
	xhost +local:docker
	clear && docker exec -it ${CONT_NAME} bash -ic "source /opt/ros/noetic/setup.bash && source /root/catkin_ws/devel/setup.bash && bash"

down:
	
	docker compose down

