Welcome to semantic_changelog!

This repository is a set of tools designed to do package versioning using changelogs.

## Motivation

When maintaining large open-source projects (often mono-repositories), dealing
with version bump can be tedious.  
One common issue is dealing with dependencies. For example, a package `a` may
depend on a packge `b`. Then, when incrementing the version of `b`, we also need to
update the dependency of `b` in the `a` package.

There are tools to help with this, such as conventional_commits. The problem is
that they rely on commits.

There are a number of problems with this approach:

- In a mono-repository, one PR may affect multiple packages at once in a different way.
  For example, this PR can both require a 0.0.x bump for one package, but
  require a x.0.0 bump for another package.
  Using convential_commits, this would require using separate commits for these changes.
  This is tedious to do and doesn't quite match the typical developer workflow.

- Having a clean commit history can be difficult.
  Asking contributors to an OSS package to rewrite the git history of their PR
  for the sake of package versioning can add a significant burden to contributors.
  This is also very error prone, and a mistake could easily slip by durign reviews.

- The semantic commit approach does not promote reviewing changelogs during PR reviews.
  Changelogs are core to users of a package. But by relying on commits to generate a
  changelog, the person who will write the changelog changes will be the person who
  will do the package release instead of the author of the PR changes.
  As such, mistakes tend to slip by.

## How it works

The idea of semantic changelogs is that we do not rely anymore on commits for
package versions. Instead, our changelog is the source of truth for versioning.

In short, when writing a PR, the PR must include a changelog entry matching
the following:

```md
## Unreleased <major/minor/patch>

/_ insert description about the changes one by this PR _/

## 1.2.3

/_ content of the changelog before this PR _/
```

The point is that the first line of the `CHANGELOG.md` of a package impacted
by a PR should contain an indication on how to bump the package version.

Then, when it is time to make a release, the version number is bumped
by relying on the major/minor/patch flag picked. The `Unreleased <flag>` text
is then replaced by the new package version.

By doing so, the git history no-longer matters. It also become possible to
make a breaking change for one package but only a bugfix for another package,
all in one commit.

This is doable because each package should have its own changelog. In which case
we could have:

```md
// The changelog of "packages/foo"

## Unreleased major
```

```md
// The changelog of "packages/bar"

## Unreleased patch
```

At the same time, this approach can be easily validated in the CI.  
A CI could check that a changelog is modified if a package is modified,
and that the changelog starts with `## Unreleased <flag>`
