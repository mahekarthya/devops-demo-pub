name: Deploy Postgres script
run-name: Setting up new postgres database & deploy scritpt 

on: [push]

jobs:
  # --- DEVELOPMENT JOB ---
  deploy-dev:
    runs-on: ubuntu-latest
    environment: Dev  # <--- This keyword tells GitHub to use Dev secrets/vars
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Run SQL file on DEV
        run: |
          psql -h "${{ secrets.DB_HOSTNAME }}" \
               -p 5432 \
               -U "${{ secrets.DB_USER }}" \
               -d "${{ secrets.DB_NAME }}" \
               -f "Create_gisdb.sql"
        env:
          PGPASSWORD: ${{ secrets.DB_PASSWORD }}

  # --- TEST JOB ---
  deploy-test:
    runs-on: ubuntu-latest
    needs: deploy-dev # Ensures Test only runs after Dev is successful
    environment: Test # <--- This keyword swaps the secrets to Test values
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Run SQL file on TEST
        run: |
          psql -h "${{ secrets.DB_HOSTNAME }}" \
               -p 5432 \
               -U "${{ secrets.DB_USER }}" \
               -d "${{ secrets.DB_NAME }}" \
               -f "Create_gisdb.sql"
        env:
          PGPASSWORD: ${{ secrets.DB_PASSWORD }}
