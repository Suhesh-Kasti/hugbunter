# MCP servers

Three servers, each matching how we actually work:

| Server | Surface | Transport | Why |
|---|---|---|---|
| `arson-framework` | **51 of 157** tools | `scripts/mcp-bridge.sh` (SSE→stdio) | recon/query + repeater only |
| `burp` | 27 tools | `scripts/mcp-bridge.sh` (SSE→stdio) | manual replay, Collaborator, proxy history |
| `playwright` | 11 tools | `scripts/playwright-mcp.sh` (repo-local uv venv) | browser proof capture (alert/console) |

## Why Arson is trimmed to 51 tools

The Arson framework is untouched — all 157 tools still exist in Docker and in the
Arson web UI. `supergateway --tools …` narrows only what the **model** sees
through MCP.

Two reasons:

1. **Cost.** Tool definitions are the largest fixed part of every request.
   All 157 schemas = **420 KB (~105k tokens)**; the 51 we keep = **59.6 KB (~15k)**.
   Caching softens this, but a cache miss or any tool change pays in full.
2. **Policy.** The excluded tools are per-class exploiters (`manage_sqli`,
   `manage_xss`, `manage_ssrf`, …), config editors, and workflow runners that
   pull in nuclei/ffuf. Recon agents must not auto-fire scanners or exploit
   payloads — not exposing them enforces that instead of merely asking.

Nothing the agents need is missing: the agents reference 48 tools and the server
exposes 51 (`MISSING: NONE`, checked by `scripts/doctor.sh`).

## Adding a tool back

Edit `.mcp.json`, add one pair of args, restart the session:

```json
"args": [ "...", "--tools", "existing_tool", "--tools", "NEW_TOOL" ]
```

The full list of 157 Arson tool names is below. The heavy hitters we left out on
purpose: `manage_*` (all per-class exploiters and settings), `run_endpoint_scan`,
`run_wildcard_workflow`, `run_url_workflow`, `run_company_workflow`,
`start_auto_scan`, `run_waf_probe`, `*_auth_flow*`, `set_api_key`, `delete_*`.

Playwright and Burp are **not** trimmed — they are small and every tool is useful.

## Full Arson tool list (157)

```
activate_target add_auth_flow_step add_target browse_knowledge_base build_refresh_flow
cancel_scan capture_manual_crawl check_scan_status check_session_tokens
classify_auth_flow_refresh compare_scans configure_waf_probe consolidate_data
consolidate_endpoints create_auth_flow delete_ai_api_key delete_api_key delete_auth_flow
delete_auth_flow_step delete_target delete_target_url dry_run_waf_probe
enrich_company_assets export_scan_data find_api_endpoints find_exposed_panels
find_high_value_targets find_interesting_responses find_sensitive_files
find_subdomain_takeover find_unique_hosts get_attack_playbook get_attack_surface
get_attack_vector_model get_auth_flow_steps get_authz_summary get_auto_scan_sessions
get_discovered_endpoints get_endpoint_scan_results get_endpoint_scan_status
get_flow_metrics get_methodology get_nuclei_finding_summary get_scan_history
get_scan_hosts get_scan_results get_scan_status get_scope_overview get_scope_stats
get_session_refresh_playbook get_settings get_target_scans get_target_summary
get_target_url_screenshot get_tool_guidance get_tool_output get_waf_probe_results
get_waf_probe_run get_waf_probe_schema get_waf_probe_status get_workflow hackerone_scope
import_auth_flow_from_captures list_auth_flow_candidates list_auth_flows
list_nuclei_templates list_targets list_waf_probe_targets list_workflows
manage_access_bypass manage_attack_surface_assets manage_attack_vectors manage_auth_flows
manage_auth_recording manage_cache manage_client_identifiers manage_cmdi
manage_company_domains manage_company_tools manage_database_bundle manage_detected_flows
manage_discretionary_access manage_endpoints manage_exposed_git manage_flow_builder
manage_flow_config manage_flow_detection manage_fuzz manage_goals manage_graphql
manage_identity_patterns manage_lfi manage_manual_crawl manage_mcp_config manage_misc
manage_network_ranges manage_notes manage_param_enum manage_policy_access manage_redirect
manage_request_variants manage_request_versions manage_role_access manage_scope_rules
manage_sensitive_leak manage_session_keeper manage_session_tokens manage_smuggling
manage_sqli manage_threat_model manage_threat_model_notes manage_tool_config
manage_vector_selection manage_waf_probe manage_wildcard_tools manage_wordlists
manage_xss populate_burp query_amass_results query_attack_surface_assets query_by_cidr
query_by_tech_stack query_cloud_assets query_company_domains query_company_enumeration
query_consolidated_endpoints query_discovered_ips query_dns_records query_endpoints
query_live_servers query_network_ranges query_nuclei_findings query_parameters
query_subdomains query_target_urls query_technologies read_knowledge_file
replay_auth_flow replay_auth_flow_step replay_request run_company_workflow
run_endpoint_scan run_scan run_url_workflow run_waf_probe run_wildcard_workflow
search_all search_global search_knowledge_base set_ai_api_key set_api_key
start_auto_scan update_auth_flow update_auth_flow_step update_roi_score update_settings
whats_next
```
