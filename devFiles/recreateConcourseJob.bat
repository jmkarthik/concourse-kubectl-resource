echo y| fly -t m dp -p ckrp
echo y| fly -t m sp -p ckrp -c ./pipeline.yml -l C:/Users/jmkar_nyqdaux/.content/content.yml
fly -t m up -p ckrp
fly -t m tj -j ckrp/my-ckr-job
fly -t m watch -j ckrp/my-ckr-job
