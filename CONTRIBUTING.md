# Contributing

Thanks for your interest in contributing!

## Adding a dashboard

1. Export the dashboard from Grafana (**Share** → **Export** → **Save to file**).
   Prefer exporting with **"Export for sharing externally"** enabled so that
   data source references are templated.
2. Place the file at `dashboards/<dashboard-name>/dashboard.json`.
3. Add a `dashboards/<dashboard-name>/README.md` describing:
   - what the dashboard visualizes,
   - which Inspektor Gadget gadgets / metrics it depends on,
   - the required data source type (e.g. Prometheus, Loki),
   - any required template variables,
   - a screenshot in `screenshots/<dashboard-name>.png` if helpful.
4. Run the validator locally:
   ```sh
   ./scripts/validate.sh
   ```
5. Open a pull request. CI will re-run the validator.

## Style

- Keep dashboard JSON formatted as Grafana exports it (two-space indentation).
- Strip the top-level `id` and set `uid` to a stable, descriptive value.
- Avoid embedding environment-specific values (data source UIDs, org IDs).

## License

By contributing, you agree that your contributions will be licensed under the
[Apache License 2.0](LICENSE).
