
from pathlib import Path
from semver.version import Version

class VersionFileManager(Version):
    """
    A subclass of Version which creates a VERSION file if none exists then parses the file.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.alternate_directory_path: Path | None = None
        self.semantic_version_starting_label: str = "0.0.0"
        self.version_filename_encoding: str = "utf-8"
        self.version_filename: str = "VERSION"

    @classmethod
    def parse(cls, project_root: Path | None = None):
        """Parse version from VERSION file"""
        dummy_instance = cls(0, 0, 0)
        if project_root:
            dummy_instance.alternate_directory_path = project_root
        
        if not dummy_instance.filepath_exists:
            dummy_instance.write_version_file(dummy_instance.semantic_version_starting_label)
            return dummy_instance
        
        version_str = dummy_instance.read_version_file
        parsed = super().parse(version_str)
        
        # Create a VersionFileManager from the parsed Version
        instance = cls(parsed.major, parsed.minor, parsed.patch, 
                       parsed.prerelease, parsed.build)
        instance.alternate_directory_path = project_root
        return instance


    @property
    def version_filepath(self) -> Path:
        if self.alternate_directory_path:
            return self.alternate_directory_path / self.version_filename
        return Path(self.version_filename)

    @property
    def filepath_exists(self) -> bool:
        return self.version_filepath.exists()

    @property
    def read_version_file(self) -> str:
        return self.version_filepath.read_text(encoding=self.version_filename_encoding).strip()

    def write_version_file(self, semantic_version_label: str) -> None:
        self.version_filepath.write_text(semantic_version_label, encoding=self.version_filename_encoding)

    def update_version_file(self) -> None:
        self.write_version_file(str(self))

    def increment_major(self) -> None:
        self.bump_major()
        self.update_version_file()

    def increment_minor(self) -> None:
        self.bump_minor()
        self.update_version_file()

    def increment_patch(self) -> None:
        self.bump_patch()
        self.update_version_file()

    def increment_prerelease(self) -> None:
        self.bump_prerelease()
        self.update_version_file()

    def increment_build(self) -> None:
        super().bump_build()
        self.update_version_file()
