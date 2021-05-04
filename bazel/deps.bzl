"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    if "com_github_google_leveldb" not in native.existing_rules():
        http_archive(
            name = "com_github_google_leveldb",
            url = "https://github.com/google/leveldb/archive/v1.20.zip",
            sha256 = "5b2bd7a91489095ad54bb81ca6544561025b48ec6d19cc955325f96755d88414",
            strip_prefix = "leveldb-1.20",
            repo_mapping = repo_mapping,
            build_file = "@com_github_3rdparty_bazel_rules_leveldb//:BUILD.bazel",
        )
