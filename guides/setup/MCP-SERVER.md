# MCP 서버 구축 가이드

로컬 컴퓨터에서 MCP(Model Context Protocol) 서버를 구축하고 실행하는 방법을 안내합니다.

## 📋 사전 요구사항

- Python 3.8 이상이 설치되어 있어야 합니다
- pip 패키지 관리자가 설치되어 있어야 합니다
- 관리자 권한이 필요할 수 있습니다

## 🚀 기본 MCP 서버 구축

### 1. 프로젝트 구조 생성

```bash
# 프로젝트 폴더 생성
mkdir mymcp-server
cd mymcp-server

# 가상환경 생성 (권장)
python -m venv venv

# 가상환경 활성화
# macOS/Linux
source venv/bin/activate
# Windows
venv\Scripts\activate
```

### 2. 의존성 설치

```bash
# 기본 MCP 라이브러리 설치
pip install mcp-server

# 추가 도구 라이브러리 설치
pip install openpyxl pandas numpy requests

# 개발 도구 설치
pip install pytest black flake8
```

### 3. 기본 MCP 서버 생성

```python
# server.py
from mcp import Server
import asyncio

# MCP 서버 인스턴스 생성
server = Server("MyMCP Server")

# 기본 도구 등록
@server.tool("hello")
async def hello_tool():
    """간단한 인사말 도구"""
    return {"message": "Hello from MCP Server!"}

@server.tool("echo")
async def echo_tool(message: str):
    """메시지를 그대로 반환하는 도구"""
    return {"echo": message}

# 서버 실행
if __name__ == "__main__":
    server.run(host="0.0.0.0", port=8000)
```

### 4. 서버 실행 및 테스트

```bash
# 서버 실행
python server.py

# 다른 터미널에서 테스트
curl -X POST "http://localhost:8000/tools/hello"
curl -X POST "http://localhost:8000/tools/echo" -H "Content-Type: application/json" -d '{"message": "test"}'
```

## 🛠️ Excel 도구 구현

### 1. Excel 도구 기본 구조

```python
# excel_tools.py
import openpyxl
from openpyxl import Workbook
from openpyxl.chart import BarChart, LineChart, PieChart
import pandas as pd
from mcp import Server

class ExcelTools:
    def __init__(self):
        self.server = Server("Excel MCP Tools")
        self.register_tools()
    
    def register_tools(self):
        @self.server.tool("excel_read")
        async def excel_read(file_path: str, sheet_name: str = None):
            """Excel 파일 읽기"""
            try:
                wb = openpyxl.load_workbook(file_path)
                sheet = wb[sheet_name] if sheet_name else wb.active
                
                data = []
                for row in sheet.iter_rows(values_only=True):
                    data.append(row)
                
                return {"success": True, "data": data, "rows": len(data)}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("excel_write")
        async def excel_write(file_path: str, data: list, sheet_name: str = "Sheet1"):
            """Excel 파일 쓰기"""
            try:
                wb = Workbook()
                ws = wb.active
                ws.title = sheet_name
                
                for row in data:
                    ws.append(row)
                
                wb.save(file_path)
                return {"success": True, "message": f"파일이 {file_path}에 저장되었습니다."}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("excel_create_chart")
        async def excel_create_chart(file_path: str, chart_type: str, data_range: str, output_path: str):
            """Excel 차트 생성"""
            try:
                wb = openpyxl.load_workbook(file_path)
                ws = wb.active
                
                if chart_type == "bar":
                    chart = BarChart()
                elif chart_type == "line":
                    chart = LineChart()
                elif chart_type == "pie":
                    chart = PieChart()
                else:
                    return {"success": False, "error": "지원하지 않는 차트 유형입니다."}
                
                # 차트 데이터 설정
                chart.add_data(ws[data_range])
                ws.add_chart(chart, "E1")
                
                wb.save(output_path)
                return {"success": True, "message": "차트가 생성되었습니다."}
            except Exception as e:
                return {"success": False, "error": str(e)}
    
    def run(self, host="0.0.0.0", port=8000):
        """서버 실행"""
        self.server.run(host=host, port=port)

if __name__ == "__main__":
    excel_server = ExcelTools()
    excel_server.run()
```

### 2. Excel 도구 사용 예시

```python
# Excel 도구 테스트
import requests

# Excel 파일 읽기
response = requests.post("http://localhost:8000/tools/excel_read", 
                        json={"file_path": "data.xlsx", "sheet_name": "Sheet1"})
print(response.json())

# Excel 파일 쓰기
data = [["Name", "Age", "City"], ["John", 30, "Seoul"], ["Jane", 25, "Busan"]]
response = requests.post("http://localhost:8000/tools/excel_write",
                        json={"file_path": "output.xlsx", "data": data})
print(response.json())
```

## 📁 파일 시스템 도구 구현

### 1. 파일 시스템 도구 기본 구조

```python
# file_system_tools.py
import os
import shutil
import glob
from pathlib import Path
from mcp import Server

class FileSystemTools:
    def __init__(self):
        self.server = Server("File System MCP Tools")
        self.register_tools()
    
    def register_tools(self):
        @self.server.tool("file_search")
        async def file_search(pattern: str, directory: str = "."):
            """파일 검색"""
            try:
                search_path = os.path.join(directory, pattern)
                files = glob.glob(search_path, recursive=True)
                return {"success": True, "files": files, "count": len(files)}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("file_read")
        async def file_read(file_path: str, encoding: str = "utf-8"):
            """파일 내용 읽기"""
            try:
                with open(file_path, 'r', encoding=encoding) as f:
                    content = f.read()
                return {"success": True, "content": content, "size": len(content)}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("file_write")
        async def file_write(file_path: str, content: str, encoding: str = "utf-8"):
            """파일 내용 쓰기"""
            try:
                with open(file_path, 'w', encoding=encoding) as f:
                    f.write(content)
                return {"success": True, "message": "파일이 저장되었습니다."}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("file_organize")
        async def file_organize(directory: str, organize_by: str = "extension"):
            """파일 정리"""
            try:
                if organize_by == "extension":
                    # 확장자별로 파일 정리
                    for file_path in Path(directory).glob("*"):
                        if file_path.is_file():
                            ext = file_path.suffix.lower()
                            if ext:
                                ext_dir = Path(directory) / ext[1:]  # .txt -> txt
                                ext_dir.mkdir(exist_ok=True)
                                shutil.move(str(file_path), str(ext_dir / file_path.name))
                
                return {"success": True, "message": "파일 정리가 완료되었습니다."}
            except Exception as e:
                return {"success": False, "error": str(e)}
    
    def run(self, host="0.0.0.0", port=8000):
        """서버 실행"""
        self.server.run(host=host, port=port)

if __name__ == "__main__":
    fs_server = FileSystemTools()
    fs_server.run()
```

## 🔍 검색 도구 구현

### 1. 웹 검색 도구

```python
# search_tools.py
import requests
from bs4 import BeautifulSoup
from mcp import Server

class SearchTools:
    def __init__(self):
        self.server = Server("Search MCP Tools")
        self.register_tools()
    
    def register_tools(self):
        @self.server.tool("web_search")
        async def web_search(query: str, search_engine: str = "google"):
            """웹 검색"""
            try:
                if search_engine == "google":
                    url = f"https://www.google.com/search?q={query}"
                    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"}
                    
                    response = requests.get(url, headers=headers)
                    soup = BeautifulSoup(response.text, 'html.parser')
                    
                    # 검색 결과 추출 (실제 구현에서는 더 정교한 파싱 필요)
                    results = []
                    for result in soup.find_all('div', class_='g')[:5]:
                        title = result.find('h3')
                        if title:
                            results.append({"title": title.text})
                    
                    return {"success": True, "results": results, "query": query}
                else:
                    return {"success": False, "error": "지원하지 않는 검색 엔진입니다."}
            except Exception as e:
                return {"success": False, "error": str(e)}
        
        @self.server.tool("document_search")
        async def document_search(query: str, directory: str = "."):
            """문서 내 검색"""
            try:
                results = []
                for file_path in Path(directory).rglob("*.txt"):
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            if query.lower() in content.lower():
                                results.append({
                                    "file": str(file_path),
                                    "matches": content.lower().count(query.lower())
                                })
                    except:
                        continue
                
                return {"success": True, "results": results, "query": query}
            except Exception as e:
                return {"success": False, "error": str(e)}
    
    def run(self, host="0.0.0.0", port=8000):
        """서버 실행"""
        self.server.run(host=host, port=port)

if __name__ == "__main__":
    search_server = SearchTools()
    search_server.run()
```

## 🔧 통합 MCP 서버

### 1. 모든 도구를 통합한 서버

```python
# integrated_server.py
from mcp import Server
from excel_tools import ExcelTools
from file_system_tools import FileSystemTools
from search_tools import SearchTools

class IntegratedMCPServer:
    def __init__(self):
        self.server = Server("Integrated MCP Server")
        self.register_all_tools()
    
    def register_all_tools(self):
        # Excel 도구 등록
        excel_tools = ExcelTools()
        for tool_name, tool_func in excel_tools.server.tools.items():
            self.server.tools[tool_name] = tool_func
        
        # 파일 시스템 도구 등록
        fs_tools = FileSystemTools()
        for tool_name, tool_func in fs_tools.server.tools.items():
            self.server.tools[f"fs_{tool_name}"] = tool_func
        
        # 검색 도구 등록
        search_tools = SearchTools()
        for tool_name, tool_func in search_tools.server.tools.items():
            self.server.tools[f"search_{tool_name}"] = tool_func
        
        # 서버 상태 확인 도구
        @self.server.tool("server_status")
        async def server_status():
            """서버 상태 확인"""
            return {
                "status": "running",
                "tools_count": len(self.server.tools),
                "available_tools": list(self.server.tools.keys())
            }
    
    def run(self, host="0.0.0.0", port=8000):
        """서버 실행"""
        print(f"MCP 서버가 {host}:{port}에서 실행 중입니다...")
        print(f"사용 가능한 도구: {list(self.server.tools.keys())}")
        self.server.run(host=host, port=port)

if __name__ == "__main__":
    server = IntegratedMCPServer()
    server.run()
```

## 📋 설정 파일 관리

### 1. 환경 설정 파일

```python
# config.py
import os
from pathlib import Path

class MCPConfig:
    def __init__(self):
        self.config_file = Path.home() / ".mcp" / "config.json"
        self.load_config()
    
    def load_config(self):
        """설정 파일 로드"""
        if self.config_file.exists():
            import json
            with open(self.config_file, 'r') as f:
                self.config = json.load(f)
        else:
            self.config = self.get_default_config()
            self.save_config()
    
    def get_default_config(self):
        """기본 설정 반환"""
        return {
            "server": {
                "host": "0.0.0.0",
                "port": 8000,
                "timeout": 30000
            },
            "tools": {
                "excel": True,
                "file_system": True,
                "search": True
            },
            "security": {
                "api_key": None,
                "allowed_ips": ["127.0.0.1", "localhost"]
            }
        }
    
    def save_config(self):
        """설정 파일 저장"""
        self.config_file.parent.mkdir(parents=True, exist_ok=True)
        import json
        with open(self.config_file, 'w') as f:
            json.dump(self.config, f, indent=2)
    
    def get(self, key, default=None):
        """설정값 가져오기"""
        keys = key.split('.')
        value = self.config
        for k in keys:
            if isinstance(value, dict) and k in value:
                value = value[k]
            else:
                return default
        return value
```

### 2. 로깅 설정

```python
# logging_config.py
import logging
import sys
from pathlib import Path

def setup_logging(log_level=logging.INFO, log_file=None):
    """로깅 설정"""
    # 로그 포맷 설정
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    
    # 루트 로거 설정
    logger = logging.getLogger()
    logger.setLevel(log_level)
    
    # 콘솔 핸들러
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)
    
    # 파일 핸들러 (선택사항)
    if log_file:
        log_path = Path(log_file)
        log_path.parent.mkdir(parents=True, exist_ok=True)
        file_handler = logging.FileHandler(log_file)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
    
    return logger
```

## 🚀 서버 실행 및 관리

### 1. 서버 실행 스크립트

```bash
#!/bin/bash
# run_server.sh

# 가상환경 활성화
source venv/bin/activate

# 환경변수 설정
export MCP_SERVER_URL="http://localhost:8000/mcp"
export MCP_API_KEY="your_secret_key"

# 서버 실행
python integrated_server.py
```

### 2. Windows 배치 파일

```batch
@echo off
REM run_server.bat

REM 가상환경 활성화
call venv\Scripts\activate

REM 환경변수 설정
set MCP_SERVER_URL=http://localhost:8000/mcp
set MCP_API_KEY=your_secret_key

REM 서버 실행
python integrated_server.py
```

### 3. 서비스로 등록 (Linux/macOS)

```bash
# systemd 서비스 파일 생성
sudo tee /etc/systemd/system/mcp-server.service << EOF
[Unit]
Description=MCP Server
After=network.target

[Service]
Type=simple
User=your_username
WorkingDirectory=/path/to/mymcp-server
Environment=PATH=/path/to/mymcp-server/venv/bin
ExecStart=/path/to/mymcp-server/venv/bin/python integrated_server.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# 서비스 활성화 및 시작
sudo systemctl daemon-reload
sudo systemctl enable mcp-server
sudo systemctl start mcp-server
sudo systemctl status mcp-server
```

## 🔒 보안 설정

### 1. API 키 인증

```python
# security.py
import hashlib
import time
from functools import wraps

def require_api_key(api_key):
    """API 키 인증 데코레이터"""
    def decorator(func):
        @wraps(func)
        async def wrapper(*args, **kwargs):
            # API 키 검증 로직
            if not api_key or api_key != "your_secret_key":
                return {"success": False, "error": "Invalid API key"}
            return await func(*args, **kwargs)
        return wrapper
    return decorator

# 사용 예시
@server.tool("secure_tool")
@require_api_key("your_secret_key")
async def secure_tool():
    return {"message": "This is a secure tool"}
```

### 2. IP 화이트리스트

```python
# ip_filter.py
from functools import wraps

def require_allowed_ip(allowed_ips):
    """허용된 IP만 접근 가능하도록 제한"""
    def decorator(func):
        @wraps(func)
        async def wrapper(request, *args, **kwargs):
            client_ip = request.remote_addr
            if client_ip not in allowed_ips:
                return {"success": False, "error": "Access denied"}
            return await func(request, *args, **kwargs)
        return wrapper
    return decorator
```

## 📊 모니터링 및 로깅

### 1. 서버 상태 모니터링

```python
# monitoring.py
import psutil
import time
from datetime import datetime

class ServerMonitor:
    def __init__(self):
        self.start_time = time.time()
        self.request_count = 0
    
    def get_server_stats(self):
        """서버 통계 정보 반환"""
        process = psutil.Process()
        memory_info = process.memory_info()
        
        return {
            "uptime": time.time() - self.start_time,
            "memory_usage": memory_info.rss / 1024 / 1024,  # MB
            "cpu_percent": process.cpu_percent(),
            "request_count": self.request_count,
            "timestamp": datetime.now().isoformat()
        }
    
    def increment_request_count(self):
        """요청 카운트 증가"""
        self.request_count += 1
```

### 2. 헬스 체크 엔드포인트

```python
@server.tool("health_check")
async def health_check():
    """서버 상태 확인"""
    monitor = ServerMonitor()
    stats = monitor.get_server_stats()
    
    return {
        "status": "healthy",
        "stats": stats,
        "tools_available": len(server.tools)
    }
```

## 🧪 테스트 및 디버깅

### 1. 단위 테스트

```python
# test_server.py
import pytest
import requests
from integrated_server import IntegratedMCPServer

class TestMCPServer:
    @pytest.fixture
    def server(self):
        """테스트용 서버 인스턴스"""
        return IntegratedMCPServer()
    
    def test_server_creation(self, server):
        """서버 생성 테스트"""
        assert server is not None
        assert len(server.server.tools) > 0
    
    def test_excel_tools(self, server):
        """Excel 도구 테스트"""
        assert "excel_read" in server.server.tools
        assert "excel_write" in server.server.tools
    
    def test_file_system_tools(self, server):
        """파일 시스템 도구 테스트"""
        assert "fs_file_search" in server.server.tools
        assert "fs_file_read" in server.server.tools

if __name__ == "__main__":
    pytest.main([__file__])
```

### 2. 통합 테스트

```python
# integration_test.py
import requests
import time
import subprocess

def test_full_workflow():
    """전체 워크플로우 테스트"""
    # 서버 시작
    server_process = subprocess.Popen(["python", "integrated_server.py"])
    time.sleep(3)  # 서버 시작 대기
    
    try:
        # 서버 상태 확인
        response = requests.get("http://localhost:8000/tools/health_check")
        assert response.status_code == 200
        
        # Excel 도구 테스트
        test_data = [["Name", "Age"], ["John", 30]]
        response = requests.post("http://localhost:8000/tools/excel_write",
                               json={"file_path": "test.xlsx", "data": test_data})
        assert response.json()["success"] == True
        
        # 파일 읽기 테스트
        response = requests.post("http://localhost:8000/tools/excel_read",
                               json={"file_path": "test.xlsx"})
        assert response.json()["success"] == True
        
        print("모든 테스트가 통과했습니다!")
        
    finally:
        # 서버 종료
        server_process.terminate()
        server_process.wait()

if __name__ == "__main__":
    test_full_workflow()
```

## 📖 추가 학습 자료

- [MCP 공식 문서](https://modelcontextprotocol.io/)
- [Python MCP 라이브러리](https://github.com/modelcontextprotocol/python-mcp)
- [PyHub MCP Tools](https://mcp.pyhub.kr/)
- [Python asyncio 가이드](https://docs.python.org/3/library/asyncio.html)

## 🤝 도움 요청

MCP 서버 구축 중 문제가 발생하면:

1. **공식 문서 확인**: 위의 참고 자료를 먼저 확인
2. **GitHub Issues**: [프로젝트 이슈](https://github.com/chulgil/mymcp/issues)에서 도움 요청
3. **MCP 커뮤니티**: MCP 관련 커뮤니티에서 질문
4. **개발자 지원**: 직접 개발팀에 문의

---

**MCP 서버**를 구축하여 로컬 컴퓨터의 모든 도구를 AI와 함께 활용해보세요! 🚀
