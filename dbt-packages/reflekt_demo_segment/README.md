# reflekt_demo_segment
A dbt package generated by [Reflekt](https://github.com/GClunies/reflekt). This package includes sources, models, and docs based on the events defined in the Reflekt tracking plan `my-plan`.

To use the models in this package, reference it in the `packages.yml` of your dbt project.

```yaml
  # Example packages.yml in dbt project
  packages:
  - package: dbt-labs/dbt_utils
    version: 0.8.5

  - git: "https://github.com/your/reflekt-project-repo"
    subdirectory: "dbt-packages/reflekt_my_app"
    revision: v0.1.0__reflekt_my_app  # Git branch, tag, or specific commit (full 40-character hash)
  ```

### Reflekt resources:
- [GitHub repo](https://github.com/GClunies/reflekt)
- [Reflekt Docs](https://github.com/GClunies/reflekt/docs/DOCUMENTATION.md/#reflekt-docs)

### dbt resources:
- dbt [docs](https://docs.getdbt.com/docs/introduction)
- Docs on dbt [packages](https://docs.getdbt.com/docs/building-a-dbt-project/package-management/)
- dbt [slack & discourse communities](https://community.getdbt.com/)
- dbt [blog](https://blog.getdbt.com/)
