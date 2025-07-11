resource "aws_s3_bucket" "testbucket" {
    bucket = "yash-terrafrom-s3"
    tags = {
            Name = "yash-test-my-app-bucket-d"
        }
}
