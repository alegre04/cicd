FROM busybox
COPY app.sh /app.sh
RUN chmod +x /app.sh
CMD ["/app.sh"]
