from kafka import KafkaProducer
import json, time

TOPIC = "energy-data-boychenko"

producer = KafkaProducer(
    bootstrap_servers="localhost:9092",
    value_serializer=lambda v: json.dumps(v).encode("utf-8"),
)

for i in range(5):
    msg = {"station_id": i + 1, "mw": 30 + i * 3}
    producer.send(TOPIC, msg)
    print("sent:", msg)
    time.sleep(0.2)

producer.flush()
print("done")
