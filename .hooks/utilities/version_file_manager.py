
from pathlib import Path
from semver.version import Version

class VersionFileManager(Version):

  """
  A subclass of Version which creates a VERSION file if none exists then parses the file.
  """
  
  version_filename: str = "VERSION"
  semantic_version_starting_label: str = "0.0.0"

  def read_and_validate_version_file(version_filepath: Path) -> Version:
    
    version_label = open(version_filepath,"r").read().strip()

    assert super().is_valid(version_label), f"{str(version_filepath)} file contains invalid semantic version format."
      
    return super().parse(version_label, *args, **kwargs)

  @classmethod
  def initialize_version_file(cls, version_filepath: Path, *args, **kwargs) -> Version:

    cls.write_version_file(version_filepath)
    
    return super().parse(cls.semantic_version_starting_label, *args, **kwargs)
    
  @classmethod
  def write_version_file(cls, version_filepath: Path) -> None:
    with version_filepath.open("w", encoding = "utf-8") as f:
      f.write(cls.semantic_version_starting_label)
  

  @classmethod
  def parse(cls, alternate_version_filename: str | None = None, **kwargs):

    """
    Parse a version file. If none found initializes new version file.

    :param version_filename: Alternate Filename 
    :return: a new instance
    """

    if alternate_version_filename:
      version_filepath: Path = Path(alternate_version_filename).resolve()
    else:
      version_filepath: Path = Path(cls.version_filename).resolve()
      
    if version_filepath.exists():

      version_instance = cls.read_and_validate_version_file(version_filepath)
      
    else:
      
      version_instance = cls.initialize_version_file(version_filepath)

    return version_instance
        
    
      
    
      


      

    
    




  
