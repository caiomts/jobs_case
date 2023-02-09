from pathlib import Path
import tomllib

with open('pyproject.toml', 'rb') as f:
    data = tomllib.load(f)

with open('requirements.txt', 'w', encoding='utf-8') as f:
    f.write('\n'.join(data['project']['dependencies']))
