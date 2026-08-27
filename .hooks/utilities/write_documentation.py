
from pathlib import Path
from jinja2 import FileSystemLoader
from jinja2.sandbox import SandboxedEnvironment

def update_documentation():
    """Generate documentation from jinja2 template."""
    
    context, readme_filename, template_filename = dict(), "README.md", "README.md.jinja"

    # Update Context Here
    
    # Render and write README.md
    env = SandboxedEnvironment(loader=FileSystemLoader("."))
    template = env.get_template(template_filename)
    readme_content = template.render(context)

    with open(readme_filename, 'w') as f:
        f.write(readme_content)
