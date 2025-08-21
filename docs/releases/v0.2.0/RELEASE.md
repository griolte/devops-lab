# Release v0.2.0 – AWS Backend (S3 + DynamoDB)

**Date**: 2025-08-21

---

## Nouveautés

- Mise en place du backend distant avec :
  - Bucket **S3** pour stocker l’état Terraform (`terraform.tfstate`)
  - Table **DynamoDB** pour gérer le verrouillage d’état (state locking)
- Commande `terraform init -reconfigure` avec `backend.hcl`
- Premier vrai déploiement avec `terraform apply`
- Validation des outputs (VPC, Subnets, SG, EC2 instance)
- Vérification de la présence du fichier `terraform.tfstate` dans S3
- Vérification du state via `terraform state pull`
- Vérification finale avec `terraform plan` (no-op)

---

## Résultats

- **13 ressources créées avec succès** (VPC, Subnets, Route Tables, Security Groups, EC2, etc.)
- Backend configuré correctement → état stocké dans S3 et verrouillage via DynamoDB
- `terraform output` montre bien les IDs et IP de l’EC2 et du réseau
- `terraform plan` confirme qu’aucun changement n’est requis

---

## Captures d’écran

1. ![Backend S3](../../docs/releases/v0.2.0/screenshots/01_backend_bucket_s3.png)
2. ![DynamoDB Lock](../../docs/releases/v0.2.0/screenshots/02_ddb_lock.png)
3. ![Init Reconfigure](../../docs/releases/v0.2.0/screenshots/03_init_reconfigure.png)
4. ![Terraform Apply OK](../../docs/releases/v0.2.0/screenshots/04_tf_apply_ok.png)
5. ![Terraform Output](../../docs/releases/v0.2.0/screenshots/05_tf_output.png)
6. ![S3 tfstate](../../docs/releases/v0.2.0/screenshots/06_s3_tfstate.png)
7. ![State Pull](../../docs/releases/v0.2.0/screenshots/07_tf_state_pull.png)
8. ![Plan No-Op](../../docs/releases/v0.2.0/screenshots/08_tf_plan_noop.png)

---

✅ **Release validée** : le backend distant est opérationnel et la stack VPC+EC2 est déployée correctement.
