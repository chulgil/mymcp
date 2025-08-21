# Cursor에서 MCP 도구 사용하기

Cursor 에디터를 통해 로컬 MCP 서버에 연결하여 Excel, 파일 시스템 등의 도구를 사용하는 방법을 안내합니다.

## 📋 사전 요구사항

- Cursor 에디터가 설치되어 있어야 합니다
- 로컬 MCP 서버가 실행 중이어야 합니다
- MCP 서버 URL과 API 키가 준비되어 있어야 합니다

## 🚀 설치 및 설정

### 1. Cursor 에디터 설치

1. **Cursor 다운로드**
   - [Cursor 공식 사이트](https://cursor.sh/)에서 운영체제에 맞는 버전을 다운로드합니다.

2. **설치 및 실행**
   - 다운로드된 파일을 실행하여 설치를 완료합니다.
   - Cursor를 실행하고 계정으로 로그인합니다.

### 2. MCP 확장 프로그램 설치

1. **확장 프로그램 마켓플레이스 열기**
   - Cursor에서 `Ctrl + Shift + X` (Windows) 또는 `Cmd + Shift + X` (macOS)를 눌러 확장 프로그램 마켓플레이스를 엽니다.

2. **MCP 확장 프로그램 검색**
   - 검색창에 "MCP" 또는 "Model Context Protocol"을 입력합니다.
   - 공식 MCP 확장 프로그램을 찾아 설치합니다.

3. **확장 프로그램 활성화**
   - 설치 후 확장 프로그램을 활성화합니다.
   - 필요한 경우 Cursor를 재시작합니다.

### 3. MCP 서버 연결 설정

1. **설정 파일 열기**
   - `Ctrl + ,` (Windows) 또는 `Cmd + ,` (macOS)를 눌러 설정을 엽니다.
   - "MCP"를 검색하여 관련 설정을 찾습니다.

2. **서버 정보 입력**
   ```
   MCP Server URL: http://localhost:8000/mcp
   MCP API Key: your_api_key (필요한 경우)
   MCP Timeout: 30000
   ```

3. **연결 상태 확인**
   - 설정 후 MCP 서버와의 연결 상태를 확인합니다.
   - 연결이 성공하면 도구들이 로드됩니다.

### 4. 환경변수 설정

#### macOS/Linux
```bash
export MCP_SERVER_URL="http://localhost:8000/mcp"
export MCP_API_KEY="your_api_key"
export MCP_TIMEOUT="30000"

# 영구 설정
echo 'export MCP_SERVER_URL="http://localhost:8000/mcp"' >> ~/.zshrc
echo 'export MCP_API_KEY="your_api_key"' >> ~/.zshrc
source ~/.zshrc
```

#### Windows
```cmd
set MCP_SERVER_URL=http://localhost:8000/mcp
set MCP_API_KEY=your_api_key
set MCP_TIMEOUT=30000
```

## 🛠️ MCP 도구 사용법

### 명령 팔레트를 통한 도구 실행

1. **명령 팔레트 열기**
   - `Ctrl + Shift + P` (Windows) 또는 `Cmd + Shift + P` (macOS)를 눌러 명령 팔레트를 엽니다.

2. **MCP 도구 검색**
   - "MCP"를 검색하여 사용 가능한 도구들을 확인합니다.
   - 각 도구의 기능을 확인하고 실행할 도구를 선택합니다.

### Excel 도구 사용

#### 1. Excel 파일 읽기
```
명령 팔레트에서:
"MCP: Excel Read File" 선택
파일 경로 입력: /path/to/sales_data.xlsx
```

#### 2. 차트 생성
```
명령 팔레트에서:
"MCP: Excel Create Chart" 선택
데이터 범위 선택: A1:D12
차트 유형 선택: Bar Chart
```

#### 3. 수식 자동 생성
```
명령 팔레트에서:
"MCP: Excel Auto Formula" 선택
수식 유형 선택: BMI Calculation
데이터 범위 선택: A2:B10
```

### 파일 시스템 도구 사용

#### 1. 파일 검색
```
명령 팔레트에서:
"MCP: File Search" 선택
검색 패턴 입력: *.py
검색 경로 입력: /path/to/project
```

#### 2. 파일 내용 읽기
```
명령 팔레트에서:
"MCP: File Read" 선택
파일 경로 입력: /path/to/config.json
```

#### 3. 파일 정리
```
명령 팔레트에서:
"MCP: File Organize" 선택
정리할 폴더 선택: /path/to/downloads
정리 기준 선택: File Extension
```

### 검색 도구 사용

#### 1. 웹 검색
```
명령 팔레트에서:
"MCP: Web Search" 선택
검색어 입력: Python MCP library
검색 엔진 선택: Google
```

#### 2. 문서 검색
```
명령 팔레트에서:
"MCP: Document Search" 선택
검색어 입력: API
검색 범위 선택: Current Project
```

## 💡 실제 사용 예시

### 예시 1: Excel 데이터 분석 자동화

1. **데이터 로드**
   ```
   명령 팔레트 → "MCP: Excel Read File"
   파일 경로: /Users/username/Documents/sales_data.xlsx
   ```

2. **데이터 분석**
   ```
   명령 팔레트 → "MCP: Excel Analyze Data"
   분석 유형: Sales Trend Analysis
   데이터 범위: A1:F100
   ```

3. **차트 생성**
   ```
   명령 팔레트 → "MCP: Excel Create Chart"
   차트 유형: Line Chart
   X축: Month
   Y축: Sales Amount
   ```

### 예시 2: 프로젝트 파일 자동 정리

1. **현재 상태 분석**
   ```
   명령 팔레트 → "MCP: File Analyze"
   분석 대상: Current Project
   분석 유형: File Structure Analysis
   ```

2. **자동 정리 실행**
   ```
   명령 팔레트 → "MCP: File Auto Organize"
   정리 기준: File Type
   대상 폴더: Current Project
   ```

3. **정리 결과 확인**
   ```
   명령 팔레트 → "MCP: File Report"
   리포트 유형: Organization Summary
   ```

## 🔧 문제 해결

### 1. MCP 확장 프로그램 로딩 실패

**증상**: MCP 확장 프로그램이 설치되었지만 로드되지 않습니다.

**해결 방법**:
1. Cursor 재시작
2. 확장 프로그램 재설치
3. 확장 프로그램 호환성 확인
4. Cursor 버전 업데이트

### 2. 서버 연결 실패

**증상**: MCP 서버에 연결할 수 없습니다.

**해결 방법**:
1. MCP 서버 실행 상태 확인
2. 서버 URL과 포트 확인
3. 방화벽 설정 확인
4. 네트워크 연결 상태 확인

### 3. 도구 실행 오류

**증상**: MCP 도구가 실행되었지만 오류가 발생합니다.

**해결 방법**:
1. 도구별 로그 확인
2. 입력 파라미터 검증
3. 파일 권한 확인
4. 서버 로그 확인

## 📚 고급 사용법

### 1. 커스텀 MCP 도구 개발

자체 MCP 도구를 개발하여 Cursor에서 사용할 수 있습니다:

```python
# custom_cursor_tool.py
from mcp import Server

server = Server()

@server.tool("cursor_specific_tool")
async def cursor_specific_tool():
    # Cursor 전용 도구 구현
    pass

server.run()
```

### 2. 워크스페이스별 설정

프로젝트마다 다른 MCP 서버 설정을 사용할 수 있습니다:

```json
// .vscode/settings.json
{
    "mcp.serverUrl": "http://localhost:8000/mcp",
    "mcp.apiKey": "project_specific_key",
    "mcp.timeout": 30000
}
```

### 3. 자동화 스크립트

Cursor의 자동화 기능과 MCP를 결합하여 사용할 수 있습니다:

```json
// .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "MCP Excel Analysis",
            "type": "shell",
            "command": "python",
            "args": ["mcp_excel_analysis.py"],
            "group": "build"
        }
    ]
}
```

## 🎯 최적화 팁

### 1. 성능 향상
- 필요한 도구만 활성화
- 대용량 파일 작업 시 청크 단위 처리
- 메모리 사용량 모니터링

### 2. 워크플로우 최적화
- 자주 사용하는 도구를 단축키로 설정
- 명령 팔레트 히스토리 활용
- 프로젝트별 설정 템플릿 사용

### 3. 보안 강화
- API 키를 프로젝트별로 관리
- 로컬 네트워크에서만 접근 허용
- 정기적인 접근 로그 확인

## 🔌 확장 프로그램 개발

### 1. MCP 도구 확장

기존 MCP 도구를 확장하여 Cursor 전용 기능을 추가할 수 있습니다:

```python
@server.tool("cursor_enhanced_excel")
async def cursor_enhanced_excel():
    # Cursor 전용 Excel 도구
    # 에디터 통합, 실시간 미리보기 등
    pass
```

### 2. UI 통합

Cursor의 UI와 통합된 MCP 도구를 개발할 수 있습니다:

```python
@server.tool("cursor_ui_integration")
async def cursor_ui_integration():
    # Cursor UI와 통합된 도구
    # 사이드바 패널, 상태바 표시 등
    pass
```

## 📖 추가 학습 자료

- [MCP 공식 문서](https://modelcontextprotocol.io/)
- [Cursor 공식 문서](https://cursor.sh/docs)
- [VS Code 확장 개발 가이드](https://code.visualstudio.com/api)
- [PyHub MCP Tools](https://mcp.pyhub.kr/)
- [Excel MCP 도구 가이드](../excel/README.md)

## 🤝 도움 요청

Cursor에서 MCP 도구 사용 중 문제가 발생하면:

1. **공식 문서 확인**: 위의 참고 자료를 먼저 확인
2. **GitHub Issues**: [프로젝트 이슈](https://github.com/chulgil/mymcp/issues)에서 도움 요청
3. **Cursor 커뮤니티**: Cursor 관련 커뮤니티에서 질문
4. **MCP 커뮤니티**: MCP 관련 커뮤니티에서 도움 요청

## 🚀 향후 계획

### 1. 추가 도구 개발
- 코드 분석 도구
- 데이터베이스 연결 도구
- 클라우드 서비스 연동 도구

### 2. UI/UX 개선
- 더 직관적인 도구 인터페이스
- 드래그 앤 드롭 지원
- 실시간 미리보기 기능

### 3. 성능 최적화
- 대용량 파일 처리 개선
- 메모리 사용량 최적화
- 응답 속도 향상

---

**Cursor**와 **MCP**를 함께 사용하여 AI 기반 코딩 환경에서 로컬 도구들을 최대한 활용해보세요! 🚀
