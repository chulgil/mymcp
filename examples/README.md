# Examples - MyMCP 사용 예시 및 설정

이 폴더는 MyMCP를 사용하기 위한 모든 예시, 설정 파일, 스크립트를 포함합니다.

## 📁 폴더 구조

```
examples/
├── README.md                    # 이 파일 (전체 가이드)
├── excel/                       # Excel 도구 사용 예시
│   └── README.md               # Excel 도구 사용법 및 시나리오
└── file-system/                 # 파일 시스템 도구 사용 예시
    └── README.md               # 파일 시스템 도구 사용법 및 시나리오
```

**설정 파일과 스크립트는 별도 폴더에 있습니다:**
- **설정 파일**: [config/](../config/) 폴더
- **실행 스크립트**: [scripts/](../scripts/) 폴더

## 🚀 빠른 시작

### 1. 환경변수 설정
```bash
# 스크립트 실행 권한 부여
chmod +x scripts/environment-setup.sh

# 환경변수 자동 설정
./scripts/environment-setup.sh
```

### 2. Claude Desktop 설정
[config/](../config/) 폴더의 설정 파일 내용을 Claude Desktop 설정에 복사

### 3. MCP 서버 시작
```bash
python tools/desktop.py
```

## 📋 설정 파일 및 스크립트

### **설정 파일 (config/ 폴더)**
- **[Claude Desktop MCP 설정](../config/README.md)** - Claude Desktop MCP 서버 설정 가이드
- **[Excel 도구 설정](../config/excel-tools-config.json)** - Excel 도구 매개변수 및 설정 정의

### **실행 스크립트 (scripts/ 폴더)**
- **[환경변수 설정](../scripts/README.md)** - 환경변수 자동 설정 및 수동 설정 가이드

## 🛠️ 도구별 사용 예시

### **Excel 도구**
- [Excel 도구 사용법](excel/README.md) - Excel 파일 조작, 차트 생성, 피벗 테이블 등

### **파일 시스템 도구**
- [파일 시스템 도구 사용법](file-system/README.md) - 파일 및 디렉토리 관리

### **HWPX 도구**
- [HWPX 도구 사용법](hwpx/README.md) - 마크다운을 한글 문서로 변환

## ⚙️ 설정 파일 사용법

### **Claude Desktop 설정 방법**
1. Claude Desktop 열기
2. `Cmd+Shift+P` (macOS) 또는 `Ctrl+Shift+P` (Windows)
3. "MCP" 검색
4. "MCP: Add Server" 선택
5. [config/](../config/) 폴더의 설정 파일 내용을 복사하여 붙여넣기

### **환경변수 설정 방법**
1. [scripts/](../scripts/) 폴더의 `environment-setup.sh` 스크립트 실행
2. 또는 수동으로 환경변수 설정:
   ```bash
   export MCP_SERVER_URL="http://localhost:8000/mcp"
   export MCP_API_KEY="your_secret_api_key_here"
   ```

## 🔧 문제 해결

### **설정 파일 오류**
- JSON 문법 검증: `python -m json.tool config/claude-mcp-config.json`
- jq 사용: `jq . config/claude-mcp-config.json`

### **환경변수 설정 안됨**
- 스크립트 실행 권한 확인: `chmod +x scripts/environment-setup.sh`
- 쉘 환경 확인: zsh, bash 등

### **MCP 서버 연결 안됨**
- 포트 8000 사용 중인지 확인
- 방화벽 설정 확인
- API 키 설정 확인

## 📖 추가 정보

- **전체 프로젝트 가이드**: [README.md](../README.md)
- **설정 파일**: [config/README.md](../config/README.md)
- **실행 스크립트**: [scripts/README.md](../scripts/README.md)
- **MCP 클라이언트 설정**: [guides/setup/MCP-CLIENT.md](../guides/setup/MCP-CLIENT.md)
- **MCP 서버 구축**: [guides/setup/MCP-SERVER.md](../guides/setup/MCP-SERVER.md)
- **Claude Desktop 사용법**: [guides/claude-desktop/README.md](../guides/claude-desktop/README.md)
- **Cursor 사용법**: [guides/cursor/README.md](../guides/cursor/README.md)

## 🤝 도움 요청

문제가 발생하면:
1. [GitHub Issues](https://github.com/chulgil/mymcp/issues)에서 도움 요청
2. 오류 메시지와 함께 문제 상황 설명
3. 사용 중인 설정 파일과 환경변수 정보 포함
