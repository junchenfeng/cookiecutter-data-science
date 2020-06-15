source config.sh
source dingding.sh

echo "[INFO] CI_PROJECT_NAME : $CI_PROJECT_NAME"
echo "[INFO] CI_COMMIT_REF_NAME : $CI_COMMIT_REF_NAME"
echo "[INFO] GITLAB_USER_EMAIL: $GITLAB_USER_EMAIL"


sonar-scanner -X -Dsonar.projectKey=$CI_PROJECT_NAME \
                 -Dsonar.sources=. \
                 -Dsonar.host.url=$sonar_host \
                 -Dsonar.qualitygate.wait=true \
                 -Dsonar.login=$sonar_login_token \
                 -Dsonar.branch.name=$CI_COMMIT_REF_NAME

# wait for code scanning by sonar server
sleep 7

API="$sonar_host/api/qualitygates/project_status?projectKey=$CI_PROJECT_NAME&branch=$CI_COMMIT_REF_NAME"
echo "[\033[34;1mINFO\033[0m] Fetch SonarQube QualityGates Result From $API"

RESULT=`curl -s "$API"`

if [ "$DEBUG" != "" ];then
    echo "[\033[34;1mINFO\033[0m] API Result : $RESULT"
fi

echo "[INFO] API: $API"
echo "[INFO] API Result : $RESULT"
echo $RESULT | grep -E '\"ERROR\"'

if [ -z "`echo $RESULT | grep -E '\"ERROR\"'`" ];then
    echo "[\033[34;1mINFO\033[0m] \033[32;1mSonarQube 代码检测通过\033[0m"
    exit 0
fi

echo "[\033[31;1mERROR\033[0m] \033[31;1mSonarQube 代码检测未通过\033[0m"

# notify gitlab_user
MESSAGE=""
MESSAGE="$MESSAGE \n \n ❌ **@$GITLAB_USER_NAME** 嘿，哥们"
MESSAGE="$MESSAGE \n \n 你提交的 [ $CI_PROJECT_NAME ] $CI_COMMIT_REF_NAME SonarLint 检测没通过"
MESSAGE="$MESSAGE \n \n > $CI_COMMIT_TITLE"
MESSAGE="$MESSAGE \n \n → [Pipeline Job]($CI_JOB_URL)"
MESSAGE="$MESSAGE \n \n → [SonarQube Report](http://sonar.bg.huohua.cn/dashboard?branch=$CI_COMMIT_REF_NAME&id=$CI_PROJECT_NAME)"

echo "[\033[34;1mINFO\033[0m] 发送钉钉通知"
echo $MESSAGE
ding_notify $GITLAB_USER_EMAIL "Sonar Lint 检测失败" $MESSAGE

exit 1
