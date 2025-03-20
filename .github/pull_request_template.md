<!--📌 Pull Request Template -->

<!--📝 Description -->

This template ensures that all pull requests adhere to the project's contribution standards. It enforces proper naming conventions, code quality, CI/CD validation, and testing requirements. Following this checklist helps maintain a clean and efficient codebase while ensuring compatibility with JIRA issue tracking.

## 📌 Pull Request Checklist

### ✅ General
- [ ] This pull request is all my own work -- I have not plagiarized it.
- [ ] The PR title follows the required format: `type/FA-<issue-number>-TaskName`.
- [ ] The branch name follows the required format: `feature/meaningful-name`, `fix/issue-description`, etc.

### 📂 Code Quality
- [ ] All filenames are in `snake_case`.
- [ ] All functions and variable names follow Dart naming conventions.
- [ ] All new code is formatted with `dart format .`

### 🛠 CI/CD Validation
- [ ] Linting passes with `dart analyze`.
- [ ] The branch name is validated against the allowed patterns.
- [ ] The PR title is validated against the required format.

### 🚀 Testing
- [ ] Unit tests are included for all new features and bug fixes.
- [ ] `flutter test --coverage` has been run and the results reviewed.
- [ ] The project builds successfully without errors.

### 📝 Additional Information
<!-- Provide any extra context or details about the changes in this PR. -->

### 🔗 Related JIRA Ticket(s):
- [ ] JIRA Issue: `FA-<issue-number>`

### 📸 Screenshots (if applicable):
<!-- Add screenshots to show the changes visually. -->