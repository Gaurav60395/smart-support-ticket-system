# Smart Support Ticket System

## Overview
Smart Support Ticket System is a Spring Boot REST API application designed as a backend foundation for managing customer support tickets. 

This repository serves as a practical learning project for demonstrating an agentic software development workflow involving **Jira**, **GitHub**, **GitHub Copilot**, **GitHub Copilot Cloud Agent**, and **Atlassian Rovo MCP**.

> **Note**: Domain features (such as story `SST-1`) will be implemented incrementally through the agentic workflow.

---

## Tech Stack
- **Language**: Java 21 LTS
- **Framework**: Spring Boot 3.3.3
- **Build Tool**: Apache Maven (with Maven Wrapper included)
- **Persistence**: Spring Data JPA / Hibernate (ready for domain models)
- **Database**: H2 (In-Memory for local development)
- **Validation**: Spring Boot Starter Validation
- **Testing**: Spring Boot Starter Test (JUnit 5, MockMvc)

---

## How to Build & Run

### Prerequisites
- JDK 21 installed and configured

> Note: All Maven commands can be run from the root directory using the included Maven Wrapper (`.\mvnw.cmd` on Windows) even if Maven is not added to your system PATH.

### 1. Run Tests
From the project root directory (`d:\Chrome downloads\smart-support-ticket-system\smart-support-ticket-system`):

**Using Maven Wrapper (Recommended):**
```powershell
.\mvnw.cmd test
```

**Using installed Maven:**
```powershell
mvn test
```

### 2. Build the Package
```powershell
.\mvnw.cmd clean package
```

### 3. Run Application
```powershell
.\mvnw.cmd spring-boot:run
```
The server will start on configured port `8082`.

---

## AWS EC2 Deployment

The GitHub Actions deployment requires these repository secrets:

- `EC2_HOST`: the EC2 instance's public IP address or DNS name.
- `EC2_USERNAME`: the SSH user configured on the instance (for example, `ubuntu`).
- `EC2_SSH_KEY`: the matching SSH private key, stored as its complete contents. Both multiline keys and keys with literal `\n` line breaks are supported.
- `EC2_SSH_PASSPHRASE`: optional passphrase for an encrypted private key.

The EC2 security group and network ACLs must allow inbound SSH (TCP port 22) from the GitHub Actions runner. The key must match a public key authorized for `EC2_USERNAME`.

---

## Health Check Endpoint
Verify that the application is running and accepting HTTP requests:

```http
GET http://localhost:8082/api/v1/health
```

**Expected Response (200 OK):**
```json
{
  "status": "UP"
}
```

---

## Future Integrations
Jira integration, GitHub Copilot Cloud Agent, Atlassian Rovo MCP, and automated PR workflows will be configured at the workflow and repository level for incremental story implementations (starting with story `SST-1`).
