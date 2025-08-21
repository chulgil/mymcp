#!/bin/bash

# MyMCP 환경변수 설정 스크립트
# macOS/Linux용

echo "=== MyMCP 환경변수 설정 ==="

# MCP 서버 기본 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"
export MCP_API_KEY="your_secret_api_key_here"
export MCP_TIMEOUT="30000"
export MCP_HOST="localhost"
export MCP_PORT="8000"

# Excel 도구 관련 설정
export EXCEL_TOOLS_ENABLED="true"
export EXCEL_MAX_FILE_SIZE="100MB"
export EXCEL_ALLOWED_PATHS="~/Documents,~/Desktop,~/Downloads,./data,./reports"

# 파일 시스템 도구 설정
export FILE_SYSTEM_ENABLED="true"
export FILE_MAX_SIZE="100MB"
export FILE_ALLOWED_EXTENSIONS=".txt,.csv,.xlsx,.xls,.json,.py,.md"

# 보안 설정
export MCP_SECURITY_ENABLED="true"
export MCP_ALLOWED_IPS="127.0.0.1,localhost,::1"
export MCP_BLOCKED_EXTENSIONS=".exe,.bat,.cmd,.ps1,.sh"

# 로깅 설정
export MCP_LOG_LEVEL="info"
export MCP_LOG_FILE="./logs/mcp_server.log"
export MCP_LOG_MAX_SIZE="10MB"

# 성능 설정
export MCP_MAX_CONNECTIONS="10"
export MCP_MEMORY_LIMIT="512MB"
export MCP_FILE_CACHE_SIZE="100MB"

# 통합 설정
export CLAUDE_DESKTOP_INTEGRATION="true"
export CURSOR_INTEGRATION="true"
export AUTO_CONNECT="true"

# Python 환경 설정
export PYTHONPATH="${PYTHONPATH}:$(pwd)/tools:$(pwd)/examples"
export VIRTUAL_ENV="$(pwd)/venv"

# 필요한 디렉토리 생성
mkdir -p logs data temp config

echo "환경변수가 설정되었습니다."
echo ""
echo "현재 설정된 환경변수:"
echo "MCP_SERVER_URL: $MCP_SERVER_URL"
echo "MCP_API_KEY: $MCP_API_KEY"
echo "MCP_HOST: $MCP_HOST"
echo "MCP_PORT: $MCP_PORT"
echo "EXCEL_TOOLS_ENABLED: $EXCEL_TOOLS_ENABLED"
echo "FILE_SYSTEM_ENABLED: $FILE_SYSTEM_ENABLED"
echo "MCP_SECURITY_ENABLED: $MCP_SECURITY_ENABLED"
echo ""

# 영구 설정을 위한 .zshrc 또는 .bashrc에 추가
if [[ "$SHELL" == *"zsh"* ]]; then
    RC_FILE="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash"* ]]; then
    RC_FILE="$HOME/.bashrc"
else
    RC_FILE="$HOME/.profile"
fi

echo "영구 설정을 위해 $RC_FILE에 환경변수를 추가하시겠습니까? (y/n)"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    # 현재 디렉토리 경로
    CURRENT_DIR=$(pwd)
    
    # 환경변수 설정 라인 추가
    cat >> "$RC_FILE" << EOF

# MyMCP 환경변수 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"
export MCP_API_KEY="your_secret_api_key_here"
export MCP_TIMEOUT="30000"
export MCP_HOST="localhost"
export MCP_PORT="8000"
export EXCEL_TOOLS_ENABLED="true"
export FILE_SYSTEM_ENABLED="true"
export MCP_SECURITY_ENABLED="true"
export PYTHONPATH="\${PYTHONPATH}:$CURRENT_DIR/tools:$CURRENT_DIR/examples"
EOF
    
    echo "환경변수가 $RC_FILE에 추가되었습니다."
    echo "새로운 터미널을 열거나 'source $RC_FILE'을 실행하여 설정을 적용하세요."
else
    echo "영구 설정이 취소되었습니다."
    echo "현재 세션에서만 환경변수가 설정되어 있습니다."
fi

echo ""
echo "=== 설정 완료 ==="
echo "MCP 서버를 시작하려면: python tools/desktop.py"
echo "환경변수를 확인하려면: env | grep MCP"
