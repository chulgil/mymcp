# Scripts - MyMCP 실행 스크립트

이 폴더는 MyMCP를 실행하고 환경을 설정하기 위한 스크립트들을 포함합니다.

## 📁 포함된 스크립트

### **환경변수 설정**
- **[environment-setup.sh](environment-setup.sh)** - macOS/Linux 환경변수 자동 설정 스크립트

## 🚀 사용 방법

### **환경변수 자동 설정 (macOS/Linux)**
```bash
# 스크립트 실행 권한 부여
chmod +x scripts/environment-setup.sh

# 환경변수 자동 설정
./scripts/environment-setup.sh
```

### **수동 환경변수 설정**
```bash
# 기본 MCP 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"
export MCP_API_KEY="your_secret_api_key_here"
export MCP_TIMEOUT="30000"
export MCP_HOST="localhost"
export MCP_PORT="8000"

# Excel 도구 설정
export EXCEL_TOOLS_ENABLED="true"
export FILE_SYSTEM_ENABLED="true"

# Python 경로 설정
export PYTHONPATH="${PYTHONPATH}:$(pwd)/tools:$(pwd)/examples"
```

## ⚙️ 설정되는 환경변수들

### **MCP 서버 기본 설정**
- `MCP_SERVER_URL`: MCP 서버 URL
- `MCP_API_KEY`: API 인증 키
- `MCP_TIMEOUT`: 연결 타임아웃
- `MCP_HOST`: 서버 호스트
- `MCP_PORT`: 서버 포트

### **도구별 설정**
- `EXCEL_TOOLS_ENABLED`: Excel 도구 활성화
- `FILE_SYSTEM_ENABLED`: 파일 시스템 도구 활성화
- `EXCEL_MAX_FILE_SIZE`: Excel 파일 최대 크기
- `FILE_MAX_SIZE`: 파일 최대 크기

### **보안 설정**
- `MCP_SECURITY_ENABLED`: 보안 기능 활성화
- `MCP_ALLOWED_IPS`: 허용된 IP 주소
- `MCP_BLOCKED_EXTENSIONS`: 차단된 파일 확장자

### **로깅 및 성능**
- `MCP_LOG_LEVEL`: 로그 레벨
- `MCP_LOG_FILE`: 로그 파일 경로
- `MCP_MAX_CONNECTIONS`: 최대 연결 수
- `MCP_MEMORY_LIMIT`: 메모리 제한

## 🔧 문제 해결

### **권한 오류**
```bash
# 실행 권한 부여
chmod +x scripts/environment-setup.sh

# 관리자 권한으로 실행 (필요한 경우)
sudo ./scripts/environment-setup.sh
```

### **환경변수가 설정되지 않음**
```bash
# 현재 세션에서만 설정
source scripts/environment-setup.sh

# 또는 수동으로 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"
```

### **포트 사용 중**
```bash
# 다른 포트 사용
export MCP_PORT="8001"
export MCP_SERVER_URL="http://localhost:8001/mcp"
```

## 📁 자동 생성되는 디렉토리

스크립트 실행 시 다음 디렉토리들이 자동으로 생성됩니다:

```
mymcp/
├── logs/          # 로그 파일 저장
├── data/          # 데이터 파일 저장
├── temp/          # 임시 파일 저장
└── config/        # 설정 파일 저장
```

## 📖 추가 정보

- **전체 프로젝트 가이드**: [README.md](../README.md)
- **사용 예시**: [examples/README.md](../examples/README.md)
- **설정 파일**: [config/README.md](../config/README.md)
- **MCP 클라이언트 설정**: [guides/setup/MCP-CLIENT.md](../guides/setup/MCP-CLIENT.md)

## 🤝 도움 요청

환경변수 설정 중 문제가 발생하면:
1. [GitHub Issues](https://github.com/chulgil/mymcp/issues)에서 도움 요청
2. 오류 메시지와 함께 문제 상황 설명
3. 운영체제와 쉘 정보 포함
4. 현재 환경변수 상태 공유
