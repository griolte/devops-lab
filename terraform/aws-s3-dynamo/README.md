# Terraform AWS VPC + EC2 – v0.2.0

Ce document retrace toutes les étapes de la release **v0.2.0** avec les captures d’écran correspondantes.

---

## 1. Création du bucket S3 pour stocker le state

![S3 Bucket](../../docs/releases/v0.2.0/screenshots/01_backend_bucket_s3.png)

---

## 2. Création de la table DynamoDB pour le state lock

![DynamoDB Lock](../../docs/releases/v0.2.0/screenshots/02_ddb_lock.png)

---

## 3. Initialisation de Terraform avec reconfigure backend

![Terraform Init](../../docs/releases/v0.2.0/screenshots/03_init_reconfigure.png)

---

## 4. Terraform Apply – création des ressources (VPC, Subnets, EC2…)

![Terraform Apply](../../docs/releases/v0.2.0/screenshots/04_tf_apply_ok.png)

---

## 5. Terraform Output – récupération des informations utiles

![Terraform Output](../../docs/releases/v0.2.0/screenshots/05_tf_output.png)

---

## 6. Vérification du state dans S3

![S3 tfstate](../../docs/releases/v0.2.0/screenshots/06_s3_tfstate.png)

---

## 7. Vérification du contenu du state avec terraform state pull

![Terraform State Pull](../../docs/releases/v0.2.0/screenshots/07_tf_state_pull.png)

---

## 8. Vérification plan (noop)

![Terraform Plan Noop](../../docs/releases/v0.2.0/screenshots/08_tf_plan_noop.png)

---

✅ **Release v0.2.0 validée avec succès.**
