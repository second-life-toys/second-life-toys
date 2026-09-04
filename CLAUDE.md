# second-life-toys

**Visibility: PUBLIC — everything committed here is world-visible.** The public face: landing page, user docs, the field guide. No code.

## Guardrail (read before committing)
Only consumer-safe content belongs here: the app/integration, user docs, and the BLE wire protocol
(intentionally public). NEVER commit the root/access mechanism, crypto keys beyond the public XOR codec
key, cloud secrets, owner PII (serials, MACs, unit-tied BLE names, account/profile IDs, owner hero
names), or any "jailbreak / hack / exploit" framing. This is repair, preservation, and interoperability.

Full policy: `spidey-meta/GUARDRAIL.md`. Repo map + ADRs: `spidey-meta/SPIDEY-REPOS-PRIMER.md`.
A local secret-scan pre-commit guard is installed via `scripts/install-hooks.sh` (run once per clone);
CI runs the same scan.
