
from dataclasses import dataclass, field
from pathlib import Path
from semver.version import Version

class VersionFileManager(Version):

  """
  A subclass of Version which creates a VERSION file if none exists then parses the file.
  """

  alternate_directory_path: Path | None = None
  semantic_version_starting_label: str = "0.0.0"
  version_filename_encoding: str = "utf-8"
  version_filename: str = "VERSION"


  # def __init__(self, *args, **kwargs):
  #   if not self.filepath_exists:
  #     self.write_version_file(semantic_version_label=self.semantic_version_starting_label)
  #     version = super().parse(self.semantic_version_starting_label)
  #   else:
  #     semantic_version_label = open(self.version_filepath,"r").read().strip()
  #     version = super().parse(semantic_version_label)

    # super().__init__(version.major, version.minor, version.patch, version.prerelease, version.build, *args, **kwargs)

  @classmethod
  def parse(cls):

    dummy_instance = super().parse(cls.semantic_version_starting_label)

    if not dummy_instance.filepath_exists:
      self.write_version_file(semantic_version_label=dummy_instance.semantic_version_starting_label)
      version = super().parse(dummy_instance.semantic_version_starting_label)
    else:
      version = super().parse(dummy_instance.read_version_file)

    return version



  @property
  def filepath_exists(self):
    return self.version_filepath.exists()

  @property
  def version_filepath(self) -> Path:
    if self.alternate_directory_path:
      path = self.alternate_directory_path / Path(self.version_filename)
    else:
      path = Path(self.version_filename)
    return path

  @property
  def update_version_file(self) -> None:
    self.write_version_file(version_filepath=self.version_filepath, semantic_version_label=str(self), encoding=self.version_filename_encoding)

  @property
  def bump_major(self) -> None:
    super().bump_major()
    self.update_version_file

  @property
  def bump_minor(self) -> None:
    super().bump_minor()
    self.update_version_file

  @property
  def bump_patch(self) -> None:
    super().bump_patch()
    self.update_version_file

  @property
  def bump_prerelease(self) -> None:
    super().bump_prerelease()
    self.update_version_file
  
  @property
  def bump_build(self) -> None:
    super().bump_build()
    self.update_version_file

  @property
  def read_version_file(self) -> str:
    return open(self.version_filepath,"r").read().strip()
    
  def write_version_file(self, semantic_version_label: str) -> None:
    with self.version_filepath.open("w", encoding=self.version_filename_encoding) as f:
      f.write(semantic_version_label)

  def update_version_file(self):
    self.write_version_file(str(self))
