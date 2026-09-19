# DevBobs Observability Lab

Открытый reference-проект для небольшой production-like инфраструктуры: шесть серверов, Kubernetes, GitOps и полный контур observability. Он достаточно компактный для воспроизведения и включает ограничения, которые важны в production: SLO, алерты, runbook, трассировки, логи и владение сервисом.

## Стек

| Задача | Инструменты |
| --- | --- |
| Инфраструктура | Terraform + Ansible |
| Runtime | k3s + Argo CD |
| Телеметрия | OpenTelemetry Collector |
| Метрики и алерты | Prometheus + Grafana |
| Логи и трассировки | Loki + Tempo |

## Топология из шести серверов

```text
internet -> edge-01 -> k8s-cp-01
                     -> k8s-w-01
                     -> k8s-w-02
                     -> obs-01
                     -> ops-01
```

- `edge-01` — ingress; `k8s-cp-01` — control plane; два worker-узла запускают сервисы.
- `obs-01` хранит Grafana, Prometheus, Loki и Tempo; `ops-01` — Ansible, CI runners и резервные задачи.

## Материалы

- `main.tf`, `terraform.tfvars.example` — provider-neutral Terraform-план ресурсов.
- `hosts.yml`, `site.yml` — безопасный Ansible-базлайн.
- `otel-collector.yaml`, `prometheus-rules.yaml` — конфигурации телеметрии, SLO и алертов.
- `01-otel-collector.md` … `04-incident-navigation.md` — четыре кейса observability.
- `checkout-error-budget.md` — runbook для SLO-алерта.
- `blog-observability.json`, `hero-observability.css` — интеграция четырёх карточек в блог devbobs.ru и мягкая анимация hero-изображения.

## Начало работы

1. Адаптируйте `main.tf` под своего облачного провайдера и положите реальные параметры только в локальный `terraform.tfvars`.
2. После `terraform apply` внесите адреса в `hosts.yml`.
3. Запустите `ansible-playbook -i hosts.yml site.yml`.
4. Развёртывайте observability-манифесты через проверенный GitOps-процесс.

Никогда не коммитьте ключи, kubeconfig, реальные IP-адреса или телеметрию клиентов. Проверяйте security, retention и стоимость перед production-запуском.

## Сотрудничество

Создайте Issue с описанием текущей топологии, цели и ограничений. Не публикуйте доступы, персональные данные и внутренние диапазоны IP. Для аудита или внедрения — [DevBobs](https://devbobs.ru/#contacts).

MIT © 2026 DevBobs
