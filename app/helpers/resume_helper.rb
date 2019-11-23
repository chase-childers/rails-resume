require 'yaml'

module ResumeHelper
    @@resume_hash = nil
    @@resume_data = nil
    @@next_pull = Time.now

    @@POLL_RATE = 60*15

    def self.get_resume_data
        if (Time.now < @@next_pull) && @@resume_data.present?
            return @@resume_data
        end

        if @@resume_data.nil? || Time.now > @@next_pull
            resp = S3_CLIENT.get_object({bucket:S3_INFO[:bucket], key:S3_INFO[:file]})
            if resp.etag != @@resume_hash
                @@resume_data = YAML::load(resp.body.string)
                @@resume_hash = resp.etag
            end
            @@next_pull = Time.now + @@POLL_RATE
        end

        return @@resume_data
    end
end