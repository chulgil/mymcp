# Windows용 MCP 서버

## 개요
Windows 환경에서 실행되는 MCP (Model Context Protocol) 서버입니다.

## 특징
- **FastMCP 기반**: 현대적이고 빠른 MCP 서버 구현
- **Windows 최적화**: Windows 경로 구조와 파일 시스템에 맞춤
- **한글 문서 지원**: .hwp 파일 읽기 기능 포함
- **확장 기능**: Windows 전용 도구들

## 설치
```cmd
cd tools\windows
pip install -r requirements.txt
```

## 실행
```cmd
python desktop.py
```

## 지원 도구
- `create_folder`: 폴더 생성
- `list_folders`: 폴더 목록 조회
- `create_file`: 파일 생성
- `read_file`: 파일 읽기
- `read_hwp`: 한글 문서(.hwp) 읽기 (Windows 전용)
- `get_system_info`: 시스템 정보 조회

## 기본 경로
`c:/test/`

## 요구사항
- Python 3.11+
- Windows 10+
- olefile 라이브러리 (한글 문서 처리용)

## 한글 문서 지원
Windows 전용으로 한글 문서(.hwp)를 읽을 수 있습니다.
`olefile` 라이브러리가 필요합니다.
