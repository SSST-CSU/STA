package util.upload;

import org.apache.commons.fileupload.ProgressListener;

public class UploadListener implements ProgressListener {

    private UploadStatus status;

    public UploadListener(UploadStatus status) {
        this.status = status;

    }

    public void update(long bytesRead, long contentLength, int items) {
        // 上传组件会调用该方法
        status.setBytesRead(bytesRead); // 已读取的数据长度
        status.setContentLength(contentLength); // 文件总长度
        status.setItems(items); // 正在保存第几个文件

    }
}