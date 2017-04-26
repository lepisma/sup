from setuptools import setup

with open("README.rst") as readme_file:
    readme = readme_file.read()

project_url = "https://github.com/lepisma/sup"

setup(
    name="sup",
    version="0.1.0",
    description="One liners for kde command output widget",
    long_description=readme,
    author="Abhinav Tushar",
    author_email="abhinav.tushar.vs@gmail.com",
    url=project_url,
    install_requires=["hy==0.12.1", "sh", "criclive", "haxor-news"],
    scripts=["sup"],
    classifiers=(
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Natural Language :: English", "Programming Language :: Python",
        "Programming Language :: Python :: 3 :: Only"))
