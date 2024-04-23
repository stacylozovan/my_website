jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Set executable permission for build.sh
      run: chmod +x build.sh

    - name: Build web application
      run: ./build.sh
