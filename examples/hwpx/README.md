# HWPX 도구 사용 예시

HWPX 도구를 사용하여 마크다운 파일을 한글 문서로 변환하는 실제 사용 시나리오를 안내합니다.

## 📋 개요

이 폴더는 HWPX 도구의 실제 사용 예시와 샘플 파일들을 포함합니다.

## 🚀 사용 시나리오

### **1. 문서 변환 자동화**
- **상황**: 마크다운으로 작성된 문서를 한글 문서로 변환해야 하는 경우
- **해결**: HWPX 도구를 사용하여 자동 변환
- **장점**: 수동 복사/붙여넣기 불필요, 서식 유지

### **2. 보고서 표준화**
- **상황**: 팀원들이 마크다운으로 작성한 보고서를 한글 형식으로 통일해야 하는 경우
- **해결**: 일괄 변환으로 표준 형식 적용
- **장점**: 일관된 문서 스타일, 편집 용이성

### **3. 문서 공유 및 배포**
- **상황**: 마크다운 문서를 한글 사용자들과 공유해야 하는 경우
- **해결**: HWPX 형식으로 변환하여 호환성 확보
- **장점**: 한글 사용자 접근성 향상, 편집 가능

## 📁 샘플 파일

### **입력 마크다운 파일**
- **[sample.md](sample.md)** - HWPX 도구 테스트용 기본 마크다운 문서
  - 제목, 단락, 목록, 강조 등 다양한 마크다운 요소 포함
  - 변환 테스트 및 기능 확인용
  - 간단하고 이해하기 쉬운 구조

### **출력 HWPX 파일**
- `sample.hwpx` - sample.md를 변환한 한글 문서 (변환 후 생성됨)

## 🛠️ 실제 사용 방법

### **Claude Desktop에서 사용**

#### **기본 변환**
```
사용자: "sample.md 파일을 한글 문서로 변환해줘"

Claude: sample.md 파일을 HWPX 형식으로 변환하여 한글 문서로 사용할 수 있도록 하겠습니다.
변환이 완료되었습니다. sample.hwpx 파일이 생성되었습니다.
```

#### **파일명 지정 변환**
```
사용자: "README.md를 '프로젝트_설명서.hwpx'로 변환해줘"

Claude: README.md 파일을 '프로젝트_설명서.hwpx'로 변환하겠습니다.
변환이 완료되었습니다. 프로젝트_설명서.hwpx 파일이 생성되었습니다.
```

#### **일괄 변환**
```
사용자: "docs 폴더의 모든 마크다운 파일을 한글 문서로 변환해줘"

Claude: docs 폴더의 모든 .md 파일을 찾아서 HWPX 형식으로 변환하겠습니다.
변환된 파일들:
- docs/guide.md → guide.hwpx
- docs/api.md → api.hwpx
- docs/install.md → install.hwpx
```

### **Cursor에서 사용**

#### **명령 팔레트 사용**
1. `Cmd+Shift+P` (macOS) 또는 `Ctrl+Shift+P` (Windows)
2. "MCP: Convert Markdown to HWPX" 검색
3. 변환할 마크다운 파일 선택
4. 출력 파일명 입력

## 📊 변환 결과 예시

### **입력 마크다운 (sample.md)**
```markdown
# 프로젝트 제목

## 개요
이 프로젝트는 마크다운을 한글 문서로 변환하는 도구입니다.

## 주요 기능
- 마크다운 → HWPX 변환
- 제목 및 단락 지원
- 목록 및 강조 지원

## 사용법
1. 마크다운 파일 준비
2. HWPX 도구 실행
3. 변환된 파일 확인
```

### **변환된 HWPX 파일**
- **파일명**: `sample.hwpx`
- **형식**: 한글 문서 (HWPX)
- **내용**: 마크다운과 동일한 구조
- **스타일**: 기본 한글 폰트 및 서식

## 🔧 고급 사용법

### **사용자 정의 스타일**
```python
from tools.hwpx_tools import markdown_to_hwpx

# 기본 변환
markdown_to_hwpx("input.md", "output.hwpx")

# 스타일 커스터마이징 (향후 지원 예정)
# markdown_to_hwpx("input.md", "output.hwpx", 
#                  font_family="맑은 고딕", 
#                  font_size=12)
```

### **배치 처리**
```bash
# 폴더 내 모든 마크다운 파일 변환
for file in *.md; do
    python -c "
from tools.hwpx_tools import markdown_to_hwpx
import os
filename = os.path.splitext('$file')[0]
markdown_to_hwpx('$file', filename + '.hwpx')
"
done
```

## 📈 성능 및 제한사항

### **처리 속도**
- **소형 파일** (< 1MB): 1-2초
- **중형 파일** (1-10MB): 5-10초
- **대형 파일** (10-50MB): 30초-2분

### **파일 크기 제한**
- **입력**: 최대 50MB 마크다운 파일
- **출력**: 입력 파일의 2-3배 크기 증가 가능

### **지원 형식**
- **입력**: `.md`, `.markdown`
- **출력**: `.hwpx` (한글 2010 이상 호환)

## 🔍 문제 해결

### **일반적인 문제들**

#### **변환 실패**
```bash
# 오류 확인
python -c "from tools.hwpx_tools import markdown_to_hwpx; markdown_to_hwpx('test.md', 'test.hwpx')"

# 패키지 설치 확인
pip install markdown beautifulsoup4
```

#### **HWPX 파일 열기 안됨**
1. 파일 확장자 확인 (`.hwpx`)
2. 한글 버전 확인 (2010 이상)
3. 파일 손상 여부 확인

#### **스타일 문제**
1. 기본 폰트 설치 확인
2. 한글 언어 팩 설치 확인
3. 문서 호환성 모드 확인

## 📖 추가 정보

- **HWPX 도구 가이드**: [guides/hwpx/README.md](../../guides/hwpx/README.md)
- **전체 프로젝트 가이드**: [README.md](../../README.md)
- **MCP 클라이언트 설정**: [guides/setup/MCP-CLIENT.md](../../guides/setup/MCP-CLIENT.md)

## 🤝 도움 요청

HWPX 도구 사용 중 문제가 발생하면:
1. [GitHub Issues](https://github.com/chulgil/mymcp/issues)에서 도움 요청
2. 입력 마크다운 파일과 오류 메시지 공유
3. 사용 중인 운영체제와 한글 버전 정보 포함
4. 변환하려는 문서의 복잡도 설명
