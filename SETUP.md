```
mvn clean package dependency:copy-dependencies  -DincludeArtifactIds=fluo-recipes-core
mkdir target/lib
cp target/stresso-0.0.1-SNAPSHOT.jar target/dependency/*.jar target/lib
```


```
sed  "s|STRESSO_DIR|$(pwd)|" conf/fluo-app.properties.template > conf/fluo-app.properties
```

```
fluo init -a stresso -p conf/fluo-app.properties
```


```
accumulo shell -u root -p secret <<EOF
config -t stresso -s table.custom.balancer.group.regex.pattern=(\\\\d\\\\d).*
config -t stresso -s table.custom.balancer.group.regex.default=none
config -t stresso -s table.balancer=org.apache.accumulo.server.master.balancer.RegexGroupBalancer
config -t stresso -s table.compaction.major.ratio=1.5
config -t stresso -s table.file.compress.blocksize.index=256K
config -t stresso -s table.file.compress.blocksize=8K
config -s table.durability=flush
config -t accumulo.metadata -d table.durability
config -t accumulo.root -d table.durability
config -s tserver.readahead.concurrent.max=256
config -s tserver.server.threads.minimum=256
config -s tserver.scan.files.open.max=1000
EOF
```

```
fluo exec stresso stresso.trie.Split 17
```
