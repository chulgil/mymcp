# MCP 클라이언트 설치 및 사용 가이드

MCP (Model Context Protocol) 클라이언트를 다양한 플랫폼에 설치하고 사용하는 방법을 안내합니다.

## 지원 플랫폼

- macOS (Claude Desktop)
- Windows (Claude Desktop)
- Cursor / Windsurf
- 기타 MCP 지원 클라이언트

## macOS에서 MCP 클라이언트 설치하기

### 1. Claude Desktop 설치

1. **Claude Desktop 다운로드**
   - [Claude Desktop](https://claude.ai/download)에서 macOS용 클라이언트를 다운로드합니다.
   - Apple Silicon (M1/M2) 또는 Intel 프로세서에 맞는 버전을 선택하세요.

2. **설치 및 실행**
   - 다운로드된 `.dmg` 파일을 열고 Claude Desktop을 Applications 폴더로 드래그합니다.
   - Applications 폴더에서 Claude Desktop을 실행합니다.
   - 처음 실행 시 필요한 권한을 허용합니다.

### 2. MCP 서버 설정

1. **명령 팔레트 열기**
   - Claude Desktop에서 `Cmd + Shift + P`를 눌러 명령 팔레트를 엽니다.
   - 또는 메뉴바에서 `View > Command Palette`를 선택합니다.

2. **MCP 설정 찾기**
   - 명령 팔레트에 "MCP"를 입력합니다.
   - "MCP: Configure Server" 또는 "MCP: 서버 설정" 옵션을 찾습니다.

3. **서버 정보 입력**
   - MCP 서버 URL을 입력합니다 (예: `http://localhost:8000/mcp`)
   - API 키가 필요한 경우 입력합니다.
   - 연결 테스트를 실행하여 연결 상태를 확인합니다.

### 3. 환경변수 설정

터미널에서 다음 명령어를 실행하여 환경변수를 설정합니다:

```bash
# MCP 서버 URL 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"

# API 키 설정 (필요한 경우)
export MCP_API_KEY="your_api_key"

# 타임아웃 설정 (밀리초)
export MCP_TIMEOUT="30000"

# 영구 설정을 위해 ~/.zshrc 또는 ~/.bash_profile에 추가
echo 'export MCP_SERVER_URL="http://localhost:8000/mcp"' >> ~/.zshrc
echo 'export MCP_API_KEY="your_api_key"' >> ~/.zshrc
echo 'export MCP_TIMEOUT="30000"' >> ~/.zshrc

# 설정 적용
source ~/.zshrc
```

### 4. MCP 도구 활성화 및 테스트

1. **도구 목록 확인**
   - Claude Desktop에서 MCP 도구들이 정상적으로 로드되었는지 확인합니다.
   - 도구 패널에서 엑셀, 파일시스템, 검색 등의 도구를 찾습니다.

2. **기본 기능 테스트**
   - 간단한 파일 읽기/쓰기 작업을 테스트합니다.
   - 엑셀 도구가 정상 작동하는지 확인합니다.

## Windows에서 MCP 클라이언트 설치하기

### 1. Claude Desktop 설치

1. **Claude Desktop 다운로드**
   - [Claude Desktop](https://claude.ai/download)에서 Windows용 클라이언트를 다운로드합니다.
   - Windows 10/11 64비트 버전을 선택하세요.

2. **설치 및 실행**
   - 다운로드된 `.exe` 파일을 실행합니다.
   - 설치 마법사의 안내에 따라 설치를 완료합니다.
   - 바탕화면 또는 시작 메뉴에서 Claude Desktop을 실행합니다.

### 2. MCP 서버 설정

1. **명령 팔레트 열기**
   - Claude Desktop에서 `Ctrl + Shift + P`를 눌러 명령 팔레트를 엽니다.
   - 또는 메뉴바에서 `View > Command Palette`를 선택합니다.

2. **MCP 설정 찾기**
   - 명령 팔레트에 "MCP"를 입력합니다.
   - "MCP: Configure Server" 또는 "MCP: 서버 설정" 옵션을 찾습니다.

3. **서버 정보 입력**
   - MCP 서버 URL을 입력합니다 (예: `http://localhost:8000/mcp`)
   - API 키가 필요한 경우 입력합니다.
   - 연결 테스트를 실행하여 연결 상태를 확인합니다.

### 3. 환경변수 설정

명령 프롬프트에서 다음 명령어를 실행하여 환경변수를 설정합니다:

```cmd
# MCP 서버 URL 설정
set MCP_SERVER_URL=http://localhost:8000/mcp

# API 키 설정 (필요한 경우)
set MCP_API_KEY=your_api_key

# 타임아웃 설정 (밀리초)
set MCP_TIMEOUT=30000

# 영구 설정을 위해 시스템 환경변수에 추가
# 제어판 > 시스템 > 고급 시스템 설정 > 환경변수에서 설정
```

### 4. MCP 도구 활성화 및 테스트

1. **도구 목록 확인**
   - Claude Desktop에서 MCP 도구들이 정상적으로 로드되었는지 확인합니다.
   - 도구 패널에서 엑셀, 파일시스템, 검색 등의 도구를 찾습니다.

2. **기본 기능 테스트**
   - 간단한 파일 읽기/쓰기 작업을 테스트합니다.
   - 엑셀 도구가 정상 작동하는지 확인합니다.

## Cursor / Windsurf에서 MCP 사용하기

### 1. 확장 프로그램 설치

1. **확장 프로그램 마켓플레이스 열기**
   - Cursor나 Windsurf에서 `Ctrl + Shift + X` (Windows) 또는 `Cmd + Shift + X` (macOS)를 눌러 확장 프로그램 마켓플레이스를 엽니다.

2. **MCP 확장 프로그램 검색**
   - 검색창에 "MCP" 또는 "Model Context Protocol"을 입력합니다.
   - 공식 MCP 확장 프로그램을 찾아 설치합니다.

3. **확장 프로그램 활성화**
   - 설치 후 확장 프로그램을 활성화합니다.
   - 필요한 경우 VS Code를 재시작합니다.

### 2. MCP 서버 연결

1. **설정 파일 열기**
   - `Ctrl + ,` (Windows) 또는 `Cmd + ,` (macOS)를 눌러 설정을 엽니다.
   - "MCP"를 검색하여 관련 설정을 찾습니다.

2. **서버 정보 입력**
   - MCP 서버 URL을 입력합니다.
   - API 키가 필요한 경우 입력합니다.
   - 연결 상태를 확인합니다.

### 3. MCP 도구 사용

1. **명령 팔레트에서 도구 실행**
   - `Ctrl + Shift + P` (Windows) 또는 `Cmd + Shift + P` (macOS)를 눌러 명령 팔레트를 엽니다.
   - "MCP"를 검색하여 사용 가능한 도구들을 확인합니다.

2. **도구별 기능 테스트**
   - 각 MCP 도구의 기능을 테스트해봅니다.
   - 엑셀, 파일시스템, 검색 등의 도구가 정상 작동하는지 확인합니다.

## 기타 MCP 지원 클라이언트

### 1. 웹 기반 클라이언트

- **Claude Web**: 웹 브라우저에서 MCP 도구를 사용할 수 있습니다.
- **API 기반 클라이언트**: REST API를 통해 MCP 서버에 연결할 수 있습니다.

### 2. 모바일 클라이언트

- **iOS/Android 앱**: 모바일에서도 MCP 도구를 사용할 수 있습니다.
- **PWA (Progressive Web App)**: 웹 앱을 모바일 홈 화면에 추가하여 사용할 수 있습니다.


## 참고 자료

- [MCP 공식 문서](https://modelcontextprotocol.io/)
- [Claude Desktop 다운로드](https://claude.ai/download)
- [PyHub MCP Tools](https://mcp.pyhub.kr/)
- [MCP GitHub 저장소](https://github.com/modelcontextprotocol)
- [Claude API 문서](https://docs.anthropic.com/claude/reference)

