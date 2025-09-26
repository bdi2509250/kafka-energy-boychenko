from kafka import KafkaConsumer
import json

TOPIC = "energy-data-boychenko"
GROUP = "boychenko-python"

consumer = KafkaConsumer(
    TOPIC,
    bootstrap_servers="localhost:9092",
    group_id=GROUP,
    auto_offset_reset="latest",
    enable_auto_commit=True,
    value_deserializer=lambda v: v.decode("utf-8"),
)

print("listening...")
for msg in consumer:
    try:
        data = json.loads(msg.value)
        print(f"received: {data}")
    except Exception:
        print(f"received (raw): {msg.value}")
