resource "aws_cloudwatch_metric_alarm" "sns_trigger" {
  alarm_name                = "sns-trigger-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 50
  alarm_description         = "Make call to SNS"
  alarm_actions     = [aws_sns_topic.sns_email.arn]
}