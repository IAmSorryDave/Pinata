
from pathlib import Path
from semver.version import Version

SEMANTIC_VERSION_STARTING_LABEL = "0.0.0"
VERSION_FILENAME_ENCODING = "utf-8"
VERSION_FILENAME = "VERSION"


def get_version_filepath(project_root: Path | None = None) -> Path:
    """Get the path to the VERSION file."""
    if project_root:
        return project_root / VERSION_FILENAME
    return Path(VERSION_FILENAME)


def version_file_exists(project_root: Path | None = None) -> bool:
    """Check if VERSION file exists."""
    return get_version_filepath(project_root).exists()


def read_version_file(project_root: Path | None = None) -> str:
    """Read and return the version string from VERSION file."""
    filepath = get_version_filepath(project_root)
    return filepath.read_text(encoding=VERSION_FILENAME_ENCODING).strip()


def write_version_file(version: str, project_root: Path | None = None) -> None:
    """Write a version string to the VERSION file."""
    filepath = get_version_filepath(project_root)
    filepath.write_text(version, encoding=VERSION_FILENAME_ENCODING)


def load_version(project_root: Path | None = None) -> Version:
    """Load version from file, creating it if it doesn't exist."""
    if not version_file_exists(project_root):
        write_version_file(SEMANTIC_VERSION_STARTING_LABEL, project_root)
    version_str = read_version_file(project_root)
    return Version.parse(version_str)


