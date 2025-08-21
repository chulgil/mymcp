# Config - MyMCP 설정 파일

이 폴더는 MyMCP를 사용하기 위한 모든 설정 파일들을 포함합니다.

## 📁 포함된 설정 파일

### **Claude Desktop MCP 설정**
- **[claude-mcp-config.json](claude-mcp-config.json)** - 전체 설정 (Excel + 파일시스템)
- **[claude-mcp-config-simple.json](claude-mcp-config-simple.json)** - 간단한 설정 (Excel만)

### **Excel 도구 설정**
- **[excel-tools-config.json](excel-tools-config.json)** - Excel 도구의 모든 매개변수와 설정 정의

## 🚀 사용 방법

### **Claude Desktop 설정**
1. Claude Desktop 열기
2. `Cmd+Shift+P` (macOS) 또는 `Ctrl+Shift+P` (Windows)
3. "MCP" 검색
4. "MCP: Add Server" 선택
5. 원하는 설정 파일 내용을 복사하여 붙여넣기

### **설정 파일 설명**
- **`claude-mcp-config.json`**: MyMCP 데스크톱 통합 서버 설정
  - Excel, 파일시스템, HWPX 등 모든 도구를 통합 제공
  - 하나의 Python 프로세스로 모든 기능 실행

## ⚙️ 설정 파일 구조

### **claude-mcp-config.json**
```json
{
  "mcpServers": {
    "mymcp-desktop": {
      "command": "python",
      "args": ["tools/desktop.py"]
    }
  }
}
```

**참고**: 간단한 설정 파일은 제거되었습니다. `claude-mcp-config.json` 하나로 모든 기능을 사용할 수 있습니다.

## 🔧 문제 해결

### **설정 파일 오류**
```bash
# JSON 문법 검증
python -m json.tool config/claude-mcp-config.json

# 또는 jq 사용
jq . config/claude-mcp-config.json
```

### **MCP 서버 연결 안됨**
1. Python 경로 확인
2. tools/desktop.py 파일 존재 확인
3. 포트 8000 사용 중인지 확인

## 📖 추가 정보

- **전체 프로젝트 가이드**: [README.md](../README.md)
- **사용 예시**: [examples/README.md](../examples/README.md)
- **환경변수 설정**: [scripts/README.md](../scripts/README.md)
- **MCP 클라이언트 설정**: [guides/setup/MCP-CLIENT.md](../guides/setup/MCP-CLIENT.md)
