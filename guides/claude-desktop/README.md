# Claude Desktop에서 MCP 도구 사용하기

Claude Desktop을 통해 로컬 MCP 서버에 연결하여 Excel, 파일 시스템 등의 도구를 사용하는 방법을 안내합니다.

## 📋 사전 요구사항

- Claude Desktop이 설치되어 있어야 합니다
- 로컬 MCP 서버가 실행 중이어야 합니다
- MCP 서버 URL과 API 키가 준비되어 있어야 합니다

## 🚀 설치 및 설정

### 1. Claude Desktop 설치

1. **Claude Desktop 다운로드**
   - [Claude Desktop 공식 사이트](https://claude.ai/download)에서 운영체제에 맞는 버전을 다운로드합니다.

2. **설치 및 실행**
   - 다운로드된 파일을 실행하여 설치를 완료합니다.
   - Claude Desktop을 실행하고 Claude 계정으로 로그인합니다.

### 2. MCP 서버 연결 설정

1. **명령 팔레트 열기**
   - Claude Desktop에서 `Cmd + Shift + P` (macOS) 또는 `Ctrl + Shift + P` (Windows)를 눌러 명령 팔레트를 엽니다.

2. **MCP 설정 찾기**
   - 명령 팔레트에 "MCP"를 입력합니다.
   - "MCP: Configure Server" 또는 "MCP: 서버 설정" 옵션을 찾습니다.

3. **서버 정보 입력**
   ```
   서버 URL: http://localhost:8000/mcp
   API 키: your_api_key (필요한 경우)
   ```

4. **연결 테스트**
   - "Test Connection" 또는 "연결 테스트" 버튼을 클릭하여 연결 상태를 확인합니다.

### 3. 환경변수 설정

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

### Excel 도구 사용

#### 1. Excel 파일 읽기
```
Claude에게 요청:
"Excel 파일 'sales_data.xlsx'를 읽어서 내용을 요약해줘"
```

#### 2. 차트 생성
```
Claude에게 요청:
"sales_data.xlsx의 월별 판매량을 막대 차트로 만들어줘"
```

#### 3. 수식 자동 생성
```
Claude에게 요청:
"키와 몸무게 데이터가 있는 Excel 파일에 BMI 수식을 자동으로 생성해줘"
```

### 파일 시스템 도구 사용

#### 1. 파일 검색
```
Claude에게 요청:
"프로젝트 폴더에서 '*.py' 파일들을 찾아서 목록을 만들어줘"
```

#### 2. 파일 내용 읽기
```
Claude에게 요청:
"config.json 파일의 내용을 읽어서 설정값들을 설명해줘"
```

#### 3. 파일 정리
```
Claude에게 요청:
"Downloads 폴더의 파일들을 확장자별로 분류해서 정리해줘"
```

### 검색 도구 사용

#### 1. 웹 검색
```
Claude에게 요청:
"최신 Python MCP 라이브러리 정보를 검색해서 요약해줘"
```

#### 2. 문서 검색
```
Claude에게 요청:
"프로젝트 문서에서 'API' 관련 내용을 검색해줘"
```

## 💡 실제 사용 예시

### 예시 1: Excel 보고서 자동 생성

1. **데이터 준비**
   ```
   Claude에게 요청:
   "새로운 Excel 파일을 만들고 1월부터 12월까지의 월별 판매 데이터를 생성해줘"
   ```

2. **차트 생성**
   ```
   Claude에게 요청:
   "생성된 데이터로 월별 판매량 추이를 선 차트로 만들어줘"
   ```

3. **피벗 테이블 생성**
   ```
   Claude에게 요청:
   "제품별, 월별로 매출을 집계하는 피벗 테이블을 만들어줘"
   ```

### 예시 2: 파일 시스템 자동 정리

1. **현재 상태 분석**
   ```
   Claude에게 요청:
   "현재 작업 폴더의 파일 구조를 분석해서 정리가 필요한 부분을 찾아줘"
   ```

2. **자동 정리 실행**
   ```
   Claude에게 요청:
   "중복 파일들을 찾아서 삭제하고, 파일들을 확장자별로 분류 폴더로 이동해줘"
   ```

3. **정리 결과 요약**
   ```
   Claude에게 요청:
   "정리 작업이 완료되었는지 확인하고 결과를 요약해줘"
   ```

## 🔧 문제 해결

### 1. MCP 서버 연결 실패

**증상**: Claude Desktop에서 MCP 도구를 사용할 수 없습니다.

**해결 방법**:
1. MCP 서버가 실행 중인지 확인
2. 서버 URL이 올바른지 확인
3. 방화벽 설정 확인
4. 네트워크 연결 상태 확인

### 2. 도구가 작동하지 않음

**증상**: MCP 도구가 로드되었지만 기능이 작동하지 않습니다.

**해결 방법**:
1. Claude Desktop 재시작
2. MCP 서버 재시작
3. 환경변수 설정 확인
4. 서버 로그 확인

### 3. 권한 문제

**증상**: 파일 접근이나 수정이 거부됩니다.

**해결 방법**:
1. 파일 권한 확인
2. 관리자 권한으로 실행
3. 보안 소프트웨어 설정 확인

## 📚 고급 사용법

### 1. 커스텀 도구 생성

자체 MCP 도구를 만들어 사용할 수 있습니다:

```python
# custom_tool.py
from mcp import Server

server = Server()

@server.tool("custom_excel_tool")
async def custom_excel_tool():
    # 커스텀 Excel 도구 구현
    pass

server.run()
```

### 2. 배치 작업 자동화

여러 작업을 연속으로 실행할 수 있습니다:

```
Claude에게 요청:
"다음 작업들을 순서대로 실행해줘:
1. Excel 파일 읽기
2. 데이터 정리
3. 차트 생성
4. 결과 저장"
```

### 3. 스케줄링

정기적인 작업을 자동화할 수 있습니다:

```
Claude에게 요청:
"매주 월요일 오전 9시에 sales_report.xlsx 파일을 생성하고 차트를 업데이트하는 작업을 예약해줘"
```

## 🎯 최적화 팁

### 1. 성능 향상
- 대용량 파일 작업 시 청크 단위로 처리
- 불필요한 도구는 비활성화
- 메모리 사용량 모니터링

### 2. 보안 강화
- API 키를 안전하게 관리
- 로컬 네트워크에서만 접근 허용
- 정기적인 로그 확인

### 3. 백업 및 복구
- 중요한 설정 파일 백업
- MCP 서버 설정 백업
- 정기적인 상태 점검

## 📖 추가 학습 자료

- [MCP 공식 문서](https://modelcontextprotocol.io/)
- [Claude Desktop 사용법](https://docs.anthropic.com/claude)
- [PyHub MCP Tools](https://mcp.pyhub.kr/)
- [Excel MCP 도구 가이드](../excel/README.md)

## 🤝 도움 요청

Claude Desktop에서 MCP 도구 사용 중 문제가 발생하면:

1. **공식 문서 확인**: 위의 참고 자료를 먼저 확인
2. **GitHub Issues**: [프로젝트 이슈](https://github.com/chulgil/mymcp/issues)에서 도움 요청
3. **커뮤니티**: MCP 관련 커뮤니티에서 질문
4. **개발자 지원**: 직접 개발팀에 문의

---

**Claude Desktop**과 **MCP**를 함께 사용하여 로컬 컴퓨터의 모든 도구를 AI와 함께 활용해보세요! 🚀
