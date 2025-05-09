resource "kubernetes_deployment" "todo_app" {
  metadata {
    name = "todo-app-leam-lhcc"
    labels = {
      app = "todo"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "todo"
      }
    }

    template {
      metadata {
        labels = {
          app = "todo"
        }
      }

      spec {
        container {
          name  = "todo"
          # image = "lhcc2025/getting-started@sha256:c4ade342dd31d5c2d39556730797e853665dbfa4f329f3186b89df71a68eb96d"
          image = "${aws_ecr_repository.todo_app_repo.repository_url}:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo_service" {
  metadata {
    name = "todo-service-leam-lhcc"
  }

  spec {
    selector = {
      app = "todo"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}