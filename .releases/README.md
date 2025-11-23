# Module Properties Automation

This automation system automatically updates `.properties` files when releases are published in Bearsampp repositories.

## Overview

The system consists of three workflows:

1. **`update-module-properties.yml`** - For `modules-untouched` repository
2. **`update-releases-properties.yml`** - For individual module repositories (e.g., `module-php`)
3. **`validate-properties-links.yml`** - Validates URLs in both types of repositories

## Two Different Use Cases

### 1. modules-untouched Repository

**Purpose:** Updates `modules/MODULE.properties` files from releases in the `modules-untouched` repository.

**Release Tag Format:** `MODULENAME-YYYY.MM.DD` (e.g., `php-2025.10.31`)

**File Selection:** Files starting with the module name and ending with `.7z`, `.exe`, or `.zip`

**Version Extraction:** 
- First tries to extract version from filename (supports 2+ part versions: `X.Y`, `X.Y.Z`, `X.Y.Z.W`, etc.)
- Falls back to release name if version not found in filename
- Special handling for `composer` (.phar files) and `xlight` (version from release name only)

**Example:** 
- Release: `php-2025.10.31`
- Files: `php-8.3.14-Win32-vs16-x64.zip`, `php-8.2.25-Win32-vs16-x64.zip`
- Updates: `modules/php.properties`

### 2. Individual Module Repositories

**Purpose:** Updates `releases.properties` file from releases in module repositories (e.g., `module-php`).

**Release Tag Format:** Date format `YYYY.MM.DD` (e.g., `2025.10.31`)

**File Selection:** Only `.7z` files in the release (excludes checksum files like `.md5`, `.sha1`, etc.)

**Process:**
1. A PR is manually created with module configurations (php.ini, bearsampp.conf, etc.)
2. PR is merged
3. Modules are built with Gradle
4. Built modules are copied to a **pre-release** with `.7z` files
5. **Workflow triggers** on pre-release and updates `releases.properties`
6. After link validation passes, PR auto-merges

**Example:**
- Repository: `module-php`
- Pre-release: `2025.10.31`
- Files: `bearsampp-php-8.3.27-2025.10.31.7z`, `bearsampp-php-8.4.14-2025.10.31.7z`
- Updates: `releases.properties` with entries:
  - `8.3.27 = https://github.com/Bearsampp/module-php/releases/download/2025.10.31/bearsampp-php-8.3.27-2025.10.31.7z`
  - `8.4.14 = https://github.com/Bearsampp/module-php/releases/download/2025.10.31/bearsampp-php-8.4.14-2025.10.31.7z`

## Setup Instructions

### For modules-untouched Repository

1. **Add Secret:**
   - Go to repository Settings → Secrets and variables → Actions
   - Create secret: `GH_PAT` with a Personal Access Token (PAT) that has `repo` and `workflow` permissions

2. **Enable Auto-Merge:**
   - Go to Settings → General → Pull Requests
   - Check "Allow auto-merge"

3. **Deploy Workflows:**
   ```bash
   # Copy to modules-untouched/.github/workflows/
   cp .releases/update-module-properties.yml /path/to/modules-untouched/.github/workflows/
   cp .releases/validate-properties-links.yml /path/to/modules-untouched/.github/workflows/
   ```

### For Individual Module Repositories

1. **Add Secret:**
   - Go to repository Settings → Secrets and variables → Actions
   - Create secret: `GH_PAT` with a Personal Access Token (PAT) that has `repo` and `workflow` permissions

2. **Enable Auto-Merge:**
   - Go to Settings → General → Pull Requests
   - Check "Allow auto-merge"

3. **Deploy Workflows:**
   ```bash
   # Copy to module-php/.github/workflows/ (or other module repo)
   cp .releases/update-releases-properties.yml /path/to/module-php/.github/workflows/
   cp .releases/validate-properties-links.yml /path/to/module-php/.github/workflows/
   ```

## How It Works

### modules-untouched Workflow

```
┌─────────────────────────────┐
│  modules-untouched Release  │
│  Tag: php-2025.10.31        │
└──────────┬──────────────────┘
           │
           │ 1. Release Published
           ▼
┌─────────────────────────────┐
│ update-module-properties    │
│                             │
│ • Extracts module name      │
│ • Finds php-*.zip files     │
│ • Parses version numbers    │
│ • Updates modules/php.props │
│ • Sorts by semver           │
│ • Creates PR                │
└──────────┬──────────────────┘
           │
           │ 2. PR Created
           ▼
┌───────────────────────���─────┐
│ validate-properties-links   │
│                             │
│ • Validates all URLs        │
│ • Comments on PR            │
│ • Blocks if invalid         │
└──────────┬──────────────────┘
           │
           │ 3. Validation Passes
           ▼
┌─────────────────────────────┐
│      Auto-Merge PR          │
└─────────────────────────────┘
```

### Module Repository Workflow

```
┌─────────────────────────────┐
│   module-php Release        │
│   Tag: 2025.10.31           │
└──────────┬──────────────────┘
           │
           │ 1. Release Published
           ▼
┌─────────────────────────────┐
│ update-releases-properties  │
│                             │
│ • Finds all .7z/.zip files  │
│ • Parses version numbers    │
│ • Updates releases.props    │
│ • Sorts by semver           │
│ • Creates PR                │
└──────────┬──���───────────────┘
           │
           │ 2. PR Created
           ▼
┌─────────────────────────────┐
│ validate-properties-links   │
│                             │
│ • Validates all URLs        │
│ • Comments on PR            │
│ • Blocks if invalid         │
└──────────┬──────────────────┘
           │
           │ 3. Validation Passes
           ▼
┌─────────────────────────────┐
│      Auto-Merge PR          │
└─────────────────────────────┘
```

## File Format

Both workflows maintain the same `.properties` file format:

```properties
version.number = https://download.url/file.zip
version.number = https://download.url/file.7z
```

**Format Rules:**
- Keys are **version numbers only** (e.g., `8.3.14`)
- **Spaces around equals sign** (` = `)
- Sorted by **semantic version** (newest first)
- Comments and headers are preserved

### Example: modules/php.properties

```properties
# PHP Module Properties
# Auto-generated and maintained by automation

8.3.14 = https://github.com/Bearsampp/modules-untouched/releases/download/php-2025.10.31/php-8.3.14-Win32-vs16-x64.zip
8.3.13 = https://github.com/Bearsampp/modules-untouched/releases/download/php-2024.11.30/php-8.3.13-Win32-vs16-x64.zip
8.2.25 = https://github.com/Bearsampp/modules-untouched/releases/download/php-2024.10.2/php-8.2.25-Win32-vs16-x64.zip
```

### Example: releases.properties

```properties
# PHP Releases Properties
# Auto-generated and maintained by automation

8.4.14 = https://github.com/Bearsampp/module-php/releases/download/2025.10.31/bearsampp-php-8.4.14-2025.10.31.7z
8.3.27 = https://github.com/Bearsampp/module-php/releases/download/2025.10.31/bearsampp-php-8.3.27-2025.10.31.7z
8.3.26 = https://github.com/Bearsampp/module-php/releases/download/2025.9.24/bearsampp-php-8.3.26-2025.9.24.7z
```

## Usage

### Automatic Trigger

Workflows automatically run when a release is published in the repository.

### Manual Trigger

You can manually trigger workflows from the GitHub Actions tab:

**For modules-untouched:**
1. Go to Actions → Update Module Properties
2. Click "Run workflow"
3. Enter release tag (e.g., `php-2025.10.31`)

**For module repositories:**
1. Go to Actions → Update Releases Properties
2. Click "Run workflow"
3. Enter release tag (e.g., `2025.10.31`)

## What Each Workflow Does

### update-module-properties.yml (modules-untouched)

1. **Extracts module name** from release tag (e.g., `php-2025.10.31` → `php`)
2. **Finds matching files** that start with module name and end with `.7z`, `.exe`, or `.zip`
3. **Parses version numbers** from filenames (or release name as fallback)
4. **Updates** `modules/{module}.properties` file
5. **Sorts** entries by semantic version (newest first)
6. **Creates PR** with auto-merge enabled

**Special Module Handling:**
- **composer**: Accepts `.phar` files, extracts version from filename or release name
- **xlight**: Looks for `xlight-x64.zip`, always uses version from release name (e.g., "Xlight 3.9.4.6")
- **git**: Files start with `portable` instead of `git` (e.g., `PortableGit-2.48.1-64-bit.7z.exe`)
- **All others**: Standard processing with filename → release name fallback

### update-releases-properties.yml (module repos)

1. **Extracts module name** from repository name (e.g., `module-php` → `php`)
2. **Finds all files** ending with `.7z` only
3. **Parses version numbers** from filenames
4. **Updates** `releases.properties` file
5. **Sorts** entries by semantic version (newest first)
6. **Creates PR** with auto-merge enabled

### validate-properties-links.yml (both)

1. **Detects changed** `.properties` files in PR
2. **Validates all URLs** by sending HTTP requests
3. **Reports results** in PR comments
4. **Blocks merge** if any URLs are invalid
5. **Re-runs** when PR is edited

## Troubleshooting

### Release Tag Format Issues (modules-untouched)

**Error:** "Could not extract module name from tag"

**Solution:** Ensure release tags follow the format `MODULENAME-YYYY.MM.DD`
- ✅ Correct: `php-2025.10.31`, `apache-2025.11.15`
- ❌ Wrong: `php_2025.10.31`, `2025.10.31`, `php-v2025.10.31`

### No Files Found

**Issue:** "No .7z or .zip assets found"

**For modules-untouched:**
- Ensure files start with the module name (e.g., `php-8.3.14-...`)
- Check that files end with `.7z` or `.zip`

**For module repos:**
- Ensure files end with `.7z` only
- Any filename is accepted as long as it has the `.7z` extension

### Version Not Extracted

**Issue:** "Could not extract version from filename or release name"

**Solution:** The workflow tries two methods to extract version:

1. **From filename** - Supports flexible version formats:
   - ✅ 2-part: `postgresql-13.23-...zip` → `13.23`
   - ✅ 3-part: `php-8.3.14-...zip` → `8.3.14`
   - ✅ 4-part: `xlight-3.9.4.6.zip` → `3.9.4.6`
   - ✅ 5+ parts: Any number of dot-separated numbers
   - ❌ Wrong: `php-latest.zip`, `apache.zip` (no version)

2. **From release name** (fallback) - If filename doesn't contain version:
   - Set release name to include version (e.g., "PHP 8.3.14", "PostgreSQL 13.23")
   - Workflow will extract and use this version

**Detailed Error Output:**
When version extraction fails, the workflow provides detailed debug information including:
- Module name and release tag
- Filename and URL of the problematic asset
- Regex pattern used for matching
- All available assets in the release

### Pre-Release to Release Conversion

**Issue:** Workflow doesn't trigger when changing a pre-release to a full release

**Solution:** The workflow now triggers on three events:
- `published` - When a new release is published
- `released` - When a pre-release is converted to a full release
- `edited` - When a release is edited

If the workflow still doesn't trigger, manually run it from the Actions tab.

### Link Validation Failing

**Common Issues:**
- **404 Not Found**: File may not be uploaded yet or was deleted
- **Timeout**: Large files or slow servers
- **Connection errors**: Temporary network issues

**Solutions:**
1. Check the workflow logs for specific errors
2. Manually verify URLs in a browser
3. Re-run validation by editing the PR (add a space to description)
4. Fix invalid URLs by editing the properties file in the PR

### Auto-Merge Not Working

**Checklist:**
1. ✅ "Allow auto-merge" enabled in repository settings
2. ✅ `GH_PAT` secret has sufficient permissions
3. ✅ Link validation workflow passed
4. ✅ No branch protection rules blocking merge

## Security Considerations

- Store `GH_PAT` as a repository secret, never in code
- Use a PAT with minimal required permissions (`repo`, `workflow`)
- Regularly rotate PATs
- Review auto-merged PRs periodically

## Testing

Before relying on automation:

1. Create a test release with the correct tag format
2. Verify the workflow runs successfully
3. Check that the PR is created correctly
4. Confirm link validation works
5. Ensure auto-merge completes

## Support

For issues or questions:
1. Check GitHub Actions logs for detailed error messages
2. Review this documentation
3. Verify release tag formats and file naming
4. Open an issue in the appropriate repository
