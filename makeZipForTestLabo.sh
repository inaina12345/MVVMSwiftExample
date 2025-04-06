cd FOLDER_WITH_TEST_OUTPUT/Build/Products
rm -rf MyTests.zip
zip -r MyTests.zip Debug-iphoneos *-arm64.xctestrun
