instance_id=i-b4a3c647
export RETRY_COUNT=60
export RETRY_INTERVAL=5

# stop instance
result=`aws ec2 stop-instances --instance-ids ${instance_id} 2>&1`
if [ $? -ne 0 ]; then
    echo "error"
    exit 1
fi

# check instance status
count=0
while [ "${count}" -le "${RETRY_COUNT}" ]; do
    sleep "${RETRY_INTERVAL}"
    current_state=`aws ec2 describe-instances --instance-ids "${instance_id}" --query "Reservations[].Instances[].State.Name" --output text 2>&1`
	if [ $? -ne 0 ]; then
        echo "error (´；ω；｀)"
        exit 1
    fi
    if [ "${current_state}" = "stopped" ]; then
	    echo "status is stopped. (●´ω｀●)"
        break
    fi

    if [ "${count}" -eq "${RETRY_COUNT}" ]; then
        echo "[ERROR] count over"
        exit 1
    fi
    count=`expr ${count} + 1`
	echo "waiting"
done

exit 0
