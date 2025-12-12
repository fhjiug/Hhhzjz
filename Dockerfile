# Utiliser l'image Ubuntu 22.04 comme base
FROM ubuntu:22.04

# Définir l'environnement non interactif pour les installations
ENV DEBIAN_FRONTEND=noninteractive

# Mettre à jour les paquets, installer les dépendances nécessaires,
# configurer le fuseau horaire (Kathmandu) et nettoyer les caches
RUN apt-get update && \
    apt-get install -y tmate tzdata expect && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Copier le script de démarrage dans l'image
COPY start.sh /start.sh

# Rendre le script exécutable
RUN chmod +x /start.sh
