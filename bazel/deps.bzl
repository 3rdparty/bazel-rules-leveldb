"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    if "com_github_google_leveldb" not in native.existing_rules():
        http_archive(
            name = "com_github_google_leveldb",
            url = "https://github.com/google/leveldb/archive/refs/tags/1.23.zip",
#            sha256 = "",
            strip_prefix = "leveldb-1.23",
            repo_mapping = repo_mapping,
            build_file = "@com_github_3rdparty_bazel_rules_leveldb//:BUILD.bazel",
        )
