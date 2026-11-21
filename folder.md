static-website-devops/
├── website/                  # Your static site files
│   ├── index.html
│   ├── css/
│   ├── js/
│   └── images/
├── nginx/
│   └── mysite.conf           # Nginx (or Apache) config you used
├── scripts/
│   ├── deploy.sh             # Script to copy files to the server
│   ├── setup-server.sh       # Installs nginx, configures firewall, etc.
│   └── backup.sh             # Optional backup script
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD pipeline (GitHub Actions)
├── docs/
│   └── screenshots/          # Proof that it works
├── .gitignore
└── README.md                 # Most important file