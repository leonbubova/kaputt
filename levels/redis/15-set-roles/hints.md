## 1
A set holds unique members with no order — the right shape for "is X allowed?" questions, where you only care about membership. `SMEMBERS roles` is empty.
## 2
SADD adds one or more members, creating the set if needed.
## 3
`redis-cli SADD roles admin editor viewer`
