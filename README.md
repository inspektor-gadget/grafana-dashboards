# Grafana Dashboards for Inspektor Gadget

A collection of [Grafana](https://grafana.com/) dashboards for visualizing
metrics and observability data produced by [Inspektor
Gadget](https://github.com/inspektor-gadget/inspektor-gadget).

## Repository layout

```
.
├── dashboards/      # Grafana dashboard JSON files
├── screenshots/     # Preview images referenced from dashboard READMEs
└── scripts/         # Helper scripts (validation, formatting, etc.)
```

Each dashboard lives in its own subdirectory under `dashboards/` with:

- `dashboard.json` — the dashboard model exported from Grafana
- `README.md`      — description, required gadgets, data sources, screenshots

## Importing a dashboard

1. Open Grafana → **Dashboards** → **New** → **Import**.
2. Upload the `dashboard.json` file (or paste its contents).
3. Select the appropriate data source when prompted.

You can also load dashboards via the [Grafana
provisioning](https://grafana.com/docs/grafana/latest/administration/provisioning/#dashboards)
mechanism by mounting the `dashboards/` directory into Grafana and pointing a
dashboard provider at it.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). In short:

1. Place new dashboards under `dashboards/<dashboard-name>/dashboard.json`.
2. Add a short `README.md` describing what it shows and how to use it.
3. Run `./scripts/validate.sh` to ensure all dashboards are valid JSON.
4. Open a pull request.

## License

This project is licensed under the [Apache License 2.0](LICENSE).
